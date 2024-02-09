import 'package:flutter/material.dart';
import 'package:genzo/src/commons/widgets/custom_textbutton_widget.dart';
import 'package:genzo/src/core/navigation_service/navigation_service.dart';
import 'package:genzo/src/features/auth_screens/forgot_password/forgot_password.dart';
import 'package:genzo/src/res/assets.dart';
import 'package:genzo/src/res/strings.dart';
import '../../../commons/widgets/custom_divider.dart';
import '../../../commons/widgets/primary_elevated_button.dart';
import '../../../utils/screen_dimensions.dart';
import 'widgets/custom_elevatedbutton1.dart';
import 'widgets/custom_textformfield.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    final ph = MediaQuery.of(context).size.height;
    final pw = MediaQuery.of(context).size.width;
    ScreenDimensions screenDimensions = ScreenDimensions(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenDimensions.screenHeight * 0.03,
              ),
              CustomTextformfield(
                  hintText: TextFieldHint.fullnameHint,
                  showPasswordIcon: false),
              SizedBox(
                height: screenDimensions.screenHeight * 0.015,
              ),
              CustomTextformfield(
                hintText: TextFieldHint.passwordHint,
                isObscured: true,
              ),
              SizedBox(
                height: screenDimensions.screenHeight * 0.040,
              ),
              PrimaryElevatedButtonWidget(
                  onPressed: () {}, buttonText: ElevatedButtonText.signin),
              SizedBox(
                height: screenDimensions.screenHeight * 0.008,
              ),
              CustomTextButtonWidget(
                  buttonText: TextButtonText.forgotPassword,
                  fontSize: 12,
                  onPressed: () {
                    nextScreen(
                      context,
                      ForgotPasswordScreen(),
                    );
                  },
                  textcolor: Colors.blue),
              SizedBox(
                height: screenDimensions.screenHeight * 0.025,
              ),
              const CustomDividerTextWidget(text: Onboarding.dividerOr),
              SizedBox(
                height: screenDimensions.screenHeight * 0.025,
              ),
              PrimaryElevatedButtonWidget1(
                  onPressed: () {},
                  buttonText: Authentication.google,
                  leadingImage: const AssetImage(
                    ImageAssets.googleLogoPng,
                  )),
              SizedBox(
                height: screenDimensions.screenHeight * 0.011,
              ),
              PrimaryElevatedButtonWidget1(
                  onPressed: () {},
                  buttonText: Authentication.apple,
                  leadingImage: const AssetImage(
                    ImageAssets.appleLogoPng,
                  )),
              SizedBox(
                height: screenDimensions.screenHeight * 0.011,
              ),
              PrimaryElevatedButtonWidget1(
                  onPressed: () {},
                  buttonText: Authentication.Facebook,
                  leadingImage: const AssetImage(
                    ImageAssets.facebookLogoPng,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
