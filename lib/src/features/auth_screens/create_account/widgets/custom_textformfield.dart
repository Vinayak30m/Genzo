import 'package:flutter/material.dart';

import '../../../../utils/screen_dimensions.dart';

class CustomTextformfield extends StatefulWidget {
  final String hintText;
  bool isObscured;
  bool showPasswordIcon;

  CustomTextformfield({
    Key? key,
    required this.hintText,
    this.isObscured = false,
    this.showPasswordIcon = true,
  }) : super(key: key);

  @override
  State<CustomTextformfield> createState() => _CustomTextformfieldState();
}

class _CustomTextformfieldState extends State<CustomTextformfield> {
  String? _validateText(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    // You can add more specific validation logic here if needed
    return null;
  }

  @override
  Widget build(BuildContext context) {
    ScreenDimensions screenDimensions = ScreenDimensions(context);
    return Container(
      height: screenDimensions.screenHeight * 0.065,
      child: TextFormField(
        obscureText: widget.isObscured,
        validator: _validateText,
        decoration: InputDecoration(
          labelText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: screenDimensions.screenHeight * 0.033 * 0.15,
            color: Colors.grey, // Set the hint text color to gray
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.grey),
          ),

          focusColor: Colors.grey, // Set the focus color to gray
          suffixIcon: widget.showPasswordIcon
              ? IconButton(
                  icon: widget.isObscured
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      widget.isObscured = !widget.isObscured;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
