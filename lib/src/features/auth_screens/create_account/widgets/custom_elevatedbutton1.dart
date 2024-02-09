import 'package:flutter/material.dart';
import 'package:genzo/src/commons/widgets/custom_text_widget.dart';
import 'package:genzo/src/utils/screen_dimensions.dart';

class PrimaryElevatedButtonWidget1 extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color? borderColor;
  final double? borderWidth;
  final double? fontSizefactor;
  final Color? buttonColor;
  final Color? textColor;
  final ImageProvider? leadingImage;

  const PrimaryElevatedButtonWidget1({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    this.borderColor,
    this.borderWidth,
    this.fontSizefactor,
    this.buttonColor,
    this.textColor,
    this.leadingImage, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenDimensions screenDimensions = ScreenDimensions(context);

    return Padding(
      padding: const EdgeInsets.only(
        right: 4,
      ),
      child: Container(
        height: screenDimensions.screenHeight * 0.053,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(buttonColor ?? Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21.39),
                side: BorderSide(
                  color: borderColor ?? Colors.blue,
                  width: borderWidth ?? 1.0,
                ),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (leadingImage != null)
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Image(
                        image: leadingImage!,
                        height: screenDimensions.screenHeight * 0.08,
                        width: screenDimensions.screenWidth * 0.08),
                  ),
                ),
              Expanded(
                child: Container(
                  width: 200,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                      child: CustomTextWidget(
                        text: buttonText,
                        style: TextStyle(
                          color: textColor ?? Colors.blue,
                          fontFamily: 'Roboto',
                        ),
                        fontSizefactor: fontSizefactor ?? 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
