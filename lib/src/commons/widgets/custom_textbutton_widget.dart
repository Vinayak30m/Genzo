import 'package:flutter/material.dart';

class CustomTextButtonWidget extends StatelessWidget {
  final String buttonText;
  final double fontSize;
  final VoidCallback onPressed;
  final Color textcolor;

  const CustomTextButtonWidget({
    super.key,
    required this.buttonText,
    required this.fontSize,
    required this.onPressed,
    required this.textcolor,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.04;
    return TextButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: textcolor,
      ),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}
