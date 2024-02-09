import 'package:flutter/widgets.dart';

class ScreenDimensions {
  final double _screenHeight;
  final double _screenWidth;

  ScreenDimensions(BuildContext context)
      : _screenHeight = MediaQuery.of(context).size.height,
        _screenWidth = MediaQuery.of(context).size.width;

  double get screenHeight => _screenHeight;
  double get screenWidth => _screenWidth;

  double proportionalHeight(double percentage) {
    return screenHeight * percentage;
  }
}
