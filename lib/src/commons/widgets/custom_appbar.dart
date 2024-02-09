import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:genzo/src/res/colors.dart';

import 'custom_textbutton_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String staticText;
  final CustomTextButtonWidget customTextButton;

  CustomAppBar({
    required this.staticText,
    required this.customTextButton,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: Text(
            staticText,
            style: GoogleFonts.oswald(
                textStyle: TextStyle(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: screenWidth * 0.05,
            )),
          )),
          customTextButton,
        ],
      ),
      bottom: PreferredSize(
        preferredSize:
            Size.fromHeight(1.0), 
        child: Container(
          color: Colors.grey, 
          height: 1.0,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
