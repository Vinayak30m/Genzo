import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:genzo/src/commons/widgets/circular_overlay_widget.dart';
import 'package:genzo/src/commons/widgets/custom_text_widget.dart';
import 'package:genzo/src/res/colors.dart';

import '../../utils/screen_dimensions.dart';

class ImageTextContainer extends StatefulWidget {
  final String imagePath;
  final String text;
  final String subText;
  final Color borderColor;
  final double borderRadius;
  final String? overlayingImage;
  final VoidCallback? onCheckboxChanged;
  final bool showBorder;
  final bool isTappable; // Added parameter to conditionally show the border

  const ImageTextContainer({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.subText,
    this.borderColor = Colors.grey,
    this.borderRadius = 10.0,
    this.overlayingImage,
    this.onCheckboxChanged,
    this.showBorder = true,
    this.isTappable = false, // Default to show border
  }) : super(key: key);

  @override
  State<ImageTextContainer> createState() => _ImageTextContainerState();
}

class _ImageTextContainerState extends State<ImageTextContainer> {
  bool isChecked = false;
  bool isDisabled = false;
  MSHCheckboxStyle style = MSHCheckboxStyle.stroke;

  @override
  Widget build(BuildContext context) {
    ScreenDimensions screenDimensions = ScreenDimensions(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        return InkWell(
          onTap: widget.onCheckboxChanged != null
              ? () {
                  setState(() {
                    isChecked = !isChecked;
                  });

                  if (widget.onCheckboxChanged != null) {
                    widget.onCheckboxChanged!();
                  }
                }
              : null,
          child: Container(
            decoration: widget.showBorder
                ? BoxDecoration(
                    border: Border.all(
                      color: widget.borderColor,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                  )
                : null, // Set decoration to null if showBorder is false
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularImageWithOverlay(
                    mainImage: widget.imagePath,
                    overlayingImage: widget.overlayingImage,
                  ),
                  SizedBox(width: screenDimensions.screenWidth * 0.028),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: widget.text,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          fontSizefactor: 16 / (319 / 14),
                        ),
                        const SizedBox(height: 0),
                        CustomTextWidget(
                          text: widget.subText,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                          fontSizefactor: 12 / (319 / 14),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: widget.onCheckboxChanged != null,
                    child: MSHCheckbox(
                      value: isChecked,
                      isDisabled: isDisabled,
                      colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                        checkedColor: AppColor.primaryColor,
                      ),
                      style: MSHCheckboxStyle.fillScaleColor,
                      onChanged: (selected) {
                        setState(() {
                          isChecked = selected;
                        });
                        if (widget.onCheckboxChanged != null) {
                          widget.onCheckboxChanged!();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: screenDimensions.screenWidth * 0.01,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
