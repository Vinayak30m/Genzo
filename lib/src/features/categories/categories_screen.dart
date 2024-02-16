import 'package:flutter/material.dart';
import 'package:genzo/src/commons/widgets/custom_appbar.dart';
import 'package:genzo/src/commons/widgets/custom_textbutton_widget.dart';
import 'package:genzo/src/features/categories/data/course_card_data/course_card_data.dart';
import 'package:genzo/src/features/categories/widget/youtube_player_widget.dart';
import 'package:genzo/src/features/home/widgets/unique_pick_card_widget.dart';
import 'package:genzo/src/res/colors.dart';

class CategoriesScreen extends StatefulWidget {
  final String categoryText;
  final String? videoUrl;
  const CategoriesScreen(
      {required this.categoryText, this.videoUrl, super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
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
          staticText: widget.categoryText),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayerControllerWidget(
              videoUrl: 'https://youtu.be/F5RNFiT1GNY?si=x8qpCQIXqjJnMBvR'),
          Expanded(
            child: ListView.builder(
                itemCount: courseData.length,
                itemBuilder: ((context, index) {
                  return Card(
                    borderOnForeground: true,
                    child: UniquePicksCardWidget(
                        course: courseData[index % courseData.length]),
                  );
                })),
          )
        ],
      ),
    );
  }
}
