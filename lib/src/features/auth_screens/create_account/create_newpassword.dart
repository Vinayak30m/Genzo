import 'package:flutter/material.dart';
import 'package:genzo/src/commons/bottom_navigation/bottom_navigation.dart';
import 'package:genzo/src/commons/widgets/custom_text_widget.dart';
import 'package:genzo/src/core/navigation_service/navigation_service.dart';
import 'package:genzo/src/features/auth_screens/create_account/widgets/custom_textformfield.dart';
import 'package:genzo/src/features/home/homescreen.dart';
import 'package:genzo/src/res/strings.dart';
import 'package:genzo/src/utils/screen_dimensions.dart';
import 'package:genzo/src/commons/widgets/primary_textfield.dart';
import 'package:genzo/src/commons/widgets/primary_elevated_button.dart';

class Newpassword extends StatefulWidget {
  const Newpassword({super.key});

  @override
  State<Newpassword> createState() => _NewpasswordState();
}

class _NewpasswordState extends State<Newpassword> {
  @override
  Widget build(BuildContext context) {
    final ph = MediaQuery.of(context).size.height;
    final pw = MediaQuery.of(context).size.width;
    ScreenDimensions screenDimensions = ScreenDimensions(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenDimensions.screenHeight * 0.220,
            ),
            CustomTextWidget(
              text: Onboarding.newpassword,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screenDimensions.screenHeight * 0.042,
            ),
            CustomTextformfield(
              hintText: TextFieldHint.passwordHint,
              isObscured: true,
              showPasswordIcon: true,
            ),
            SizedBox(
              height: screenDimensions.screenHeight * 0.015,
            ),
            CustomTextformfield(
              hintText: TextFieldHint.reenterPasswordHint,
              isObscured: true,
              showPasswordIcon: true,
            ),
            SizedBox(
              height: screenDimensions.screenHeight * 0.010,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 8, 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      Onboarding.eightdigitpassword,
                      style: TextStyle(
                        fontSize: screenDimensions.screenHeight * 0.016,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      Onboarding.uppercasepassword,
                      style: TextStyle(
                        fontSize: screenDimensions.screenHeight * 0.016,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenDimensions.screenHeight * 0.050,
            ),
            PrimaryElevatedButtonWidget(
                onPressed: () {
                  nextScreen(
                    context,
                    MyHomePage(),
                  );
                },
                buttonText: ElevatedButtonText.login),
          ],
        ),
      ),
    );
  }
}
