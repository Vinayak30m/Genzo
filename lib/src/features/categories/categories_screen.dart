import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:genzo/src/commons/widgets/custom_appbar.dart';
import 'package:genzo/src/commons/widgets/custom_textbutton_widget.dart';
import 'package:genzo/src/features/categories/data/course_card_data/course_card_data.dart';
import 'package:genzo/src/features/home/widgets/unique_pick_card_widget.dart';
import 'package:genzo/src/res/colors.dart';
import 'package:genzo/src/utils/screen_dimensions.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class CategoriesScreen extends StatelessWidget {
  final String categoryName;

  const CategoriesScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _courseStream = FirebaseFirestore.instance
        .collection('courses')
        .where('courseCategory', isEqualTo: categoryName)
        .snapshots();

    ScreenDimensions screenDimensions = ScreenDimensions(context);
    return StreamBuilder<QuerySnapshot>(
      stream: _courseStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Scaffold(
          appBar: CustomAppBar(
              customTextButton: CustomTextButtonWidget(
                buttonText: 'Back',
                onPressed: () {
                  Navigator.pop(context);
                },
                textcolor: AppColor.textbuttonColor,
                fontSize: 14,
              ),
              staticText: categoryName),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: ((context, index) {
                      final courseData = snapshot.data!.docs[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          borderOnForeground: true,
                          child: Container(
                            height: screenDimensions.screenHeight * 0.12,
                            decoration: BoxDecoration(
                                // boxShadow: <BoxShadow>[
                                //   BoxShadow(
                                //     color: Colors.black54,
                                //     blurRadius: 15.0,
                                //     offset: Offset(0.0, 1),
                                //   )
                                // ],
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color:
                                        AppColor.secondaryelevatedButtonColor,
                                    width: 1)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: screenDimensions.screenWidth * 0.4,
                                    height:
                                        screenDimensions.screenHeight * 0.15,
                                    child: Image.network(
                                      courseData['imageUrl'],
                                      fit: BoxFit.fill,
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      courseData['courseTitle'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),

                                    Container(
                                      width: screenDimensions.screenWidth * 0.4,
                                      // height: screenDimensions.screenHeight * 0.4,
                                      child: Text(
                                        courseData['courseDescription'],
                                        softWrap: true,
                                        style: TextStyle(
                                          fontSize: 8,
                                        ),
                                      ),
                                    ),
                                    Text('₹ ${courseData['coursePrice']}')
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
              )
            ],
          ),
        );
      },
    );
  }
}
