import 'package:flutter/material.dart';

import '../../utils/screen_dimensions.dart';

class PrimaryTextfield extends StatefulWidget {
  final String hintText;
  bool isObscured;

  // New property to control the visibility of the password icon
  bool showPasswordIcon;

  PrimaryTextfield(
      {Key? key,
      required this.hintText,
      this.isObscured = false,
      this.showPasswordIcon = true})
      : super(key: key);

  @override
  State<PrimaryTextfield> createState() => _PrimaryTextfieldState();
}

class _PrimaryTextfieldState extends State<PrimaryTextfield> {
  @override
  Widget build(BuildContext context) {
    ScreenDimensions screenDimensions = ScreenDimensions(context);

    // Calculate the iconSize based on a percentage of screen height
    double iconSize = screenDimensions.screenHeight * 0.03;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: Color(0xFFBDC3C7)),
      ),
      height: screenDimensions.screenHeight * 0.053,
      width: double.infinity,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.025,
            ),
            Expanded(
              child: TextField(
                obscureText: widget.isObscured,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.hintText,
                    hintStyle: TextStyle(
                        fontSize:
                            screenDimensions.screenHeight * 0.053 * 0.35)),
              ),
            ),
            // Show the IconButton only if showPasswordIcon is true
            if (widget.showPasswordIcon)
              IconButton(
                icon: widget.isObscured
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    widget.isObscured = !widget.isObscured;
                  });
                },
                iconSize: iconSize,
              ),
          ],
        ),
      ),
    );
  }
}
