import 'package:flutter/material.dart';
import 'package:genzo/src/utils/screen_dimensions.dart';

class CircularImageWithOverlay extends StatefulWidget {
  String mainImage;
  String? overlayingImage;
  CircularImageWithOverlay({required this.mainImage, this.overlayingImage});

  @override
  State<CircularImageWithOverlay> createState() =>
      _CircularImageWithOverlayState();
}

class _CircularImageWithOverlayState extends State<CircularImageWithOverlay> {
  @override
  Widget build(BuildContext context) {
    ScreenDimensions screenDimensions = ScreenDimensions(context);
    return Container(
      height: screenDimensions.screenHeight * 0.061,
      width: screenDimensions.screenWidth * 0.1558,
      child: Stack(
        children: [
          Container(
            width: screenDimensions.screenWidth * 0.1364,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Image.asset(
              widget.mainImage,
              fit: BoxFit.fill,
            ),
          ),
          if (widget.overlayingImage != null)
            Positioned(
              right: 1,
              bottom: 1,
              child: Container(
                height: screenDimensions.screenHeight * 0.02,
                width: screenDimensions.screenWidth * 0.048,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Image.asset(
                  widget.overlayingImage!,
                  fit: BoxFit.fill,
                ),
              ),
            )
        ],
      ),
    );
  }
}
