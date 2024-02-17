// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:genzo/src/commons/widgets/custom_appbar.dart';
import 'package:genzo/src/commons/widgets/custom_textbutton_widget.dart';
import 'package:genzo/src/features/categories/widget/quick_access_circular_tile_widget.dart';
import 'package:genzo/src/features/categories/widget/youtube_player_widget.dart';
import 'package:genzo/src/features/home/course_detail/course_detail.dart';
import 'package:genzo/src/features/home/subviews/search_bar/custom_search_box.dart';
import 'package:genzo/src/res/colors.dart';
import 'package:genzo/src/utils/screen_dimensions.dart';
// import 'package:rounded_loading_button/rounded_loading_button.dart';

class CategoriesScreen extends StatelessWidget {
  final String categoryName;
  final String videoUrl;

  const CategoriesScreen(
      {super.key, required this.videoUrl, required this.categoryName});

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
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
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
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YoutubePlayerControllerWidget(
                    categoryTitle: categoryName,
                  ),
                  // SizedBox(
                  //   height: screenDimensions.screenHeight * 0.01,
                  // ),
                  if (categoryName == 'Rituals')
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        QuickAcessCircularWidget(
                            images: 'assets/images/png/rituals1.png',
                            text: 'Death Rituals'),
                        QuickAcessCircularWidget(
                            images: 'assets/images/png/rituals2.png',
                            text: 'Devotion'),
                        QuickAcessCircularWidget(
                            images: 'assets/images/png/rituals3.png',
                            text: 'Workship'),
                        QuickAcessCircularWidget(
                            images: 'assets/images/png/rituals4.png',
                            text: 'Pilgrimage'),
                        QuickAcessCircularWidget(
                            images: 'assets/images/png/rituals5.png',
                            text: 'Grace'),
                      ],
                    )
                  else if(categoryName == 'Gen Z')
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      QuickAcessCircularWidget(
                            images: 'assets/images/png/genz1.png',
                            text: 'Stiching and Sewing'),
                        QuickAcessCircularWidget(
                            images: 'assets/images/png/genz2.png',
                            text: 'Rapping & Freestyle'),
                        QuickAcessCircularWidget(
                            images: 'assets/images/png/genz3.png',
                            text: 'Cooking & Nutrient'),
                        QuickAcessCircularWidget(
                            images: 'assets/images/png/genz4.png',
                            text: 'Self Care'),
                        QuickAcessCircularWidget(
                            images: 'assets/images/png/genz5.png',
                            text: 'Digital Wellness'),
                      QuickAcessCircularWidget(
                            images: 'assets/images/png/genz6.png',
                            text: 'Music'),
                        QuickAcessCircularWidget(
                            images: 'assets/images/png/genz7.png',
                            text: 'Theatre'),
                        QuickAcessCircularWidget(
                            images: 'assets/images/png/genz8.png',
                            text: 'Public Speaking'),
                        QuickAcessCircularWidget(
                            images: 'assets/images/png/genz9.png',
                            text: 'Camera Posing'),
                        QuickAcessCircularWidget(
                            images: 'assets/images/png/genz10.png',
                            text: 'Creating Reels'),
                    ],
                  ),
                  else if(categoryName == 'Ayurveda')
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      QuickAcessCircularWidget(
                            images: 'assets/images/png/ayurveda1.png',
                            text: 'Ayurvedic Practices'),
                        QuickAcessCircularWidget(
                            images: 'assets/images/png/ayurveda2.png',
                            text: 'Herbal Remedies'),
                        QuickAcessCircularWidget(
                            images: 'assets/images/png/ayurveda3.png',
                            text: 'Yoga & Meditation'),
                    ],
                  ),

                  SizedBox(
                    height: screenDimensions.screenHeight * 0.01,
                  ),
                  CustomSearchBox(
                      hintText: 'Search for $categoryName learning courses'),
                  SizedBox(
                    height: screenDimensions.screenHeight * 0.01,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: ((context, index) {
                          final courseData = snapshot.data!.docs[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CourseDetailScreen(
                                    courseDetailData: courseData,
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              borderOnForeground: true,
                              child: Container(
                                height: screenDimensions.screenHeight * 0.12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color:
                                        AppColor.secondaryelevatedButtonColor,
                                    width: 1,
                                  ),
                                ),
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
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          courseData['courseTitle'],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Container(
                                          width: screenDimensions.screenWidth *
                                              0.4,
                                          child: Text(
                                            courseData['courseDescription'],
                                            softWrap: true,
                                            style: const TextStyle(
                                              fontSize: 8,
                                            ),
                                          ),
                                        ),
                                        Text('₹ ${courseData['coursePrice']}'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })),
                  )
                ],
              ),
            ),
          );
        });
  }
}
