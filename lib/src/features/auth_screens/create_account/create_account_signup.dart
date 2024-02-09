import 'package:flutter/material.dart';
import 'package:genzo/src/res/assets.dart';
import 'package:genzo/src/res/strings.dart';
import '../../../commons/widgets/custom_divider.dart';
import '../../../commons/widgets/primary_elevated_button.dart';
import '../../../utils/screen_dimensions.dart';
import 'widgets/custom_elevatedbutton1.dart';
import 'widgets/custom_textformfield.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  final TextEditingController passwordTextController = TextEditingController();

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
                showPasswordIcon: false,
              ),
              SizedBox(
                height: screenDimensions.screenHeight * 0.015,
              ),
              CustomTextformfield(
                  hintText: TextFieldHint.emailHint, showPasswordIcon: false),
              SizedBox(
                height: screenDimensions.screenHeight * 0.015,
              ),
              CustomTextformfield(
                hintText: TextFieldHint.passwordHint,
                isObscured: true,
              ),
              SizedBox(
                height: screenDimensions.screenHeight * 0.015,
              ),
              CustomTextformfield(
                hintText: TextFieldHint.reenterPasswordHint,
                isObscured: true,
              ),
              SizedBox(
                height: screenDimensions.screenHeight * 0.06,
              ),
              PrimaryElevatedButtonWidget(
                  onPressed: () {}, buttonText: ElevatedButtonText.signup),
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
