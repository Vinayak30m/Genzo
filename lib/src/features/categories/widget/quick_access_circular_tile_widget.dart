import 'package:flutter/material.dart';
import 'package:genzo/src/utils/screen_dimensions.dart';

class QuickAcessCircularWidget extends StatefulWidget {
  final String images;
  final String text;
  const QuickAcessCircularWidget(
      {required this.images, required this.text, super.key});

  @override
  State<QuickAcessCircularWidget> createState() =>
      _QuickAcessCircularWidgetState();
}

class _QuickAcessCircularWidgetState extends State<QuickAcessCircularWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenDimensions screenDimensions = ScreenDimensions(context);
    return Container(
      height: screenDimensions.screenHeight * 0.10,
      width: screenDimensions.screenWidth * 0.156,
      // color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Image.asset(widget.images),
          ),
          SizedBox(
            height: screenDimensions.screenHeight * 0.01,
          ),
          Text(
            widget.text,
            style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
