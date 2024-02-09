import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final TextStyle style;
  final double fontSizefactor;
  final TextAlign textAlign;

  CustomTextWidget(
      {required this.text,
      this.style = const TextStyle(),
      this.fontSizefactor = 1.0, this.textAlign=TextAlign.left});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double fontSize = constraints.maxWidth / 14.0 * fontSizefactor;

      return Text(
        text,
        style: style.copyWith(fontSize: fontSize),
        textAlign: textAlign,
      );
    });
  }
}
