import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:genzo/src/features/home/course_detail/course_detail.dart';
import 'package:genzo/src/res/colors.dart';
import 'package:genzo/src/utils/screen_dimensions.dart';

class searchedCourses extends StatelessWidget {
  final String searchedValue;

  const searchedCourses({super.key, required this.searchedValue});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _coursesStream =
        FirebaseFirestore.instance.collection('courses').snapshots();
    ScreenDimensions screenDimensions = ScreenDimensions(context);
    return StreamBuilder<QuerySnapshot>(
      stream: _coursesStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        final searchedData = snapshot.data!.docs.where((element) {
          return element['courseTitle']
              .toString()
              .toLowerCase()
              .contains(searchedValue.toLowerCase());
        });
        return Column(
          children: searchedData.map((e) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseDetailScreen(
                      courseDetailData: e,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                borderOnForeground: true,
                child: Container(
                  height: screenDimensions.screenHeight * 0.12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColor.secondaryelevatedButtonColor,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: screenDimensions.screenHeight * 0.12,
                        width: screenDimensions.screenWidth * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(e['imageUrl']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenDimensions.screenWidth * 0.02,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e['courseTitle'],
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            e['tutorName'],
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          // Text(
                          //   e['coursePrice'],
                          //   style: TextStyle(
                          //     fontSize: 12,
                          //     color: AppColor.secondaryelevatedButtonColor,
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
