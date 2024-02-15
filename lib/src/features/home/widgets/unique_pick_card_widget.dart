import 'package:flutter/material.dart';
import 'package:genzo/src/features/categories/model/course_model/course_model.dart';
import 'package:genzo/src/res/colors.dart';
import 'package:genzo/src/utils/screen_dimensions.dart';

class UniquePicksCardWidget extends StatefulWidget {
  final CourseModel course;
  const UniquePicksCardWidget({required this.course, super.key});

  @override
  State<UniquePicksCardWidget> createState() => _UniquePicksCardWidgetState();
}

class _UniquePicksCardWidgetState extends State<UniquePicksCardWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenDimensions screenDimensions = ScreenDimensions(context);
    return Container(
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
              color: AppColor.secondaryelevatedButtonColor, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: screenDimensions.screenWidth * 0.4,
              child: Image.asset(
                widget.course.thumbnailimage,
                fit: BoxFit.cover,
              )),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.course.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Text(widget.course.subtitle),
              Container(
                width: screenDimensions.screenWidth * 0.4,
                // height: screenDimensions.screenHeight * 0.4,
                child: Text(
                  widget.course.description,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 8,
                  ),
                ),
              ),
              Text(widget.course.price)
            ],
          )
        ],
      ),
    );
  }
}
