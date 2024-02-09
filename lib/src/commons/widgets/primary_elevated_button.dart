// import 'package:flutter/material.dart';
// import 'package:genzo/src/commons/widgets/custom_text_widget.dart';
// import 'package:genzo/src/utils/screen_dimensions.dart';

// class PrimaryElevatedButtonWidget extends StatelessWidget {
//   final VoidCallback onPressed;
//   final String buttonText;
//   const PrimaryElevatedButtonWidget(
//       {super.key, required this.onPressed, required this.buttonText});

//   @override
//   Widget build(BuildContext context) {
//     ScreenDimensions screenDimensions = ScreenDimensions(context);
//     return Container(
//       height: screenDimensions.screenHeight * 0.053,
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all<Color>(
//               Color(0xFF3498DB)), // Background color
//           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//             RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(21.39), // Border radius
//             ),
//           ),
//         ),
//         child: CustomTextWidget(
//           text: buttonText,
//           style: const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
//           fontSizefactor: 0.8,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:genzo/src/commons/widgets/custom_text_widget.dart';
import 'package:genzo/src/utils/screen_dimensions.dart';

class PrimaryElevatedButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final double? fontSizefactor;
  final Color? buttonColor;
  final Color? textColor; // Add this line

  const PrimaryElevatedButtonWidget({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    this.fontSizefactor,
    this.buttonColor,
    this.textColor, // Add this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenDimensions screenDimensions = ScreenDimensions(context);

    return Container(
      height: screenDimensions.screenHeight * 0.053,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              buttonColor ?? Color(0xFF3498DB)), // Background color
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(21.39), // Border radius
            ),
          ),
        ),
        child: CustomTextWidget(
          text: buttonText,
          style:
              TextStyle(color: textColor ?? Colors.white, fontFamily: 'Roboto'),
          fontSizefactor: fontSizefactor ??
              0.8, // Use the provided factor or the default value
        ),
      ),
    );
  }
}
