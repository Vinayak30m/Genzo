import 'package:flutter/material.dart';
import 'package:genzo/src/res/colors.dart';
import 'package:genzo/src/utils/screen_dimensions.dart';

class CategoryBoxWidget extends StatefulWidget {
  final String image;
  final String text;
  final VoidCallback onPressed;
  const CategoryBoxWidget(
      {required this.image,
      required this.text,
      required this.onPressed,
      super.key});

  @override
  State<CategoryBoxWidget> createState() => _CategoryBoxWidgetState();
}

class _CategoryBoxWidgetState extends State<CategoryBoxWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenDimensions screenDimensions = ScreenDimensions(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: widget.onPressed,
            child: Container(
              height: screenDimensions.screenHeight * 0.093,
              width: screenDimensions.screenWidth * 0.208,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: AppColor.secondaryelevatedButtonColor, width: 2.0),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: widget.image.startsWith('http')
                    ? Image.network(
                        widget.image,
                        fit: BoxFit.contain,
                      )
                    : Image.asset(
                        widget.image,
                        fit: BoxFit.contain,
                      ),
              ),
            ),
          ),
          SizedBox(
            height: screenDimensions.screenHeight * 0.005,
          ),
          Text(
            widget.text,
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
