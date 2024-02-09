import 'package:flutter/material.dart';
import 'package:genzo/src/commons/widgets/primary_elevated_button.dart';
import 'package:genzo/src/features/auth_screens/create_account/widgets/custom_elevatedbutton1.dart';
import 'package:genzo/src/res/assets.dart';
import 'package:genzo/src/res/strings.dart';
import 'package:genzo/src/utils/screen_dimensions.dart';

class Createaccountauth extends StatefulWidget {
  const Createaccountauth({super.key});

  @override
  State<Createaccountauth> createState() => _CreateaccountauthState();
}

class _CreateaccountauthState extends State<Createaccountauth> {
  @override
  Widget build(BuildContext context) {
    final ph = MediaQuery.of(context).size.height;
    final pw = MediaQuery.of(context).size.width;
    ScreenDimensions screenDimensions = ScreenDimensions(context);
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenDimensions.screenHeight * 0.05,
                  ),
                  const Center(
                    child: Text(
                      Onboarding.logo,
                      style: TextStyle(
                        color: Color(0xFF121212),
                        fontSize: 16,
                        fontFamily: Fonts.roboto,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenDimensions.screenHeight * 0.04,
                  ),
                  Image.asset(
                    ImageAssets.onBoardingScreen2png,
                  ),
                  SizedBox(
                    height: screenDimensions.screenHeight * 0.04,
                  ),
                  const Center(
                    child: Text(
                      Onboarding.onboardingmessage,
                      style: TextStyle(
                        color: Color(0xFF121212),
                        fontSize: 14,
                        fontFamily: Fonts.roboto,
                        fontWeight: FontWeight.w600,
                        height: 1.1,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenDimensions.screenHeight * 0.04,
                  ),
                  PrimaryElevatedButtonWidget(
                    onPressed: () {},
                    buttonText: Authentication.email,
                  ),
                  SizedBox(
                    height: screenDimensions.screenHeight * 0.011,
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
                  SizedBox(
                    height: screenDimensions.screenHeight * 0.020,
                  ),
                  const Divider(indent: 6, endIndent: 6),
                  SizedBox(
                    height: screenDimensions.screenHeight * 0.020,
                  ),
                  const Text(
                    Onboarding.termsandconsition,
                    style: TextStyle(
                      color: Color(0xFF121212),
                      fontSize: 10,
                      fontFamily: Fonts.roboto,
                      fontWeight: FontWeight.w400,
                      height: 1.2,
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
