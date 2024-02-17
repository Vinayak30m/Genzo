import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:genzo/src/features/auth_screens/create_account/create_account.dart';
import 'package:genzo/src/features/auth_screens/create_account/widgets/custom_textformfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:genzo/src/commons/widgets/custom_text_widget.dart';
import 'package:genzo/src/commons/widgets/custom_textbutton_widget.dart';
import 'package:genzo/src/commons/widgets/primary_elevated_button.dart';
import 'package:genzo/src/core/navigation_service/navigation_service.dart';
import 'package:genzo/src/features/auth_screens/create_account/create_newpassword.dart';
import 'package:genzo/src/res/colors.dart';
import 'package:genzo/src/res/strings.dart';
import 'package:genzo/src/utils/screen_dimensions.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    ScreenDimensions screenDimensions = ScreenDimensions(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: screenDimensions.screenHeight * 0.23,
            ),
            CustomTextformfield(
              hintText: TextFieldHint.emailHint,
              showPasswordIcon: false,
              controller: _emailTextController,
            ),
            SizedBox(
              height: screenDimensions.screenHeight * 0.025,
            ),
            PrimaryElevatedButtonWidget(
              onPressed: () {
                auth
                    .sendPasswordResetEmail(
                        email: _emailTextController.text.toString())
                    .then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('An email has been sent to your email.'),
                    ),
                  );
                }).onError((error, stackTrace) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('An error occured. Please try again.'),
                    ),
                  );
                });
                Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateAccount()));
              },
              buttonText: ElevatedButtonText.forgotPassword,
            )
            // CustomTextWidget(
            //   text: Onboarding.forgotPassword,
            //   style: GoogleFonts.roboto(
            //     textStyle: const TextStyle(
            //       fontSize: 25,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: screenDimensions.screenHeight * 0.025,
            // ),
            // CustomTextWidget(
            //   text: Onboarding.verificationMessage,
            //   style: GoogleFonts.roboto(
            //     textStyle: const TextStyle(
            //       fontSize: 14,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            //   fontSizefactor: 14 / (360 / 14),
            // ),
            // SizedBox(
            //   height: screenDimensions.screenHeight * 0.04,
            // ),
            // Container(
            //   width: screenDimensions.screenWidth * double.infinity,
            //   child: OtpTextField(
            //     numberOfFields: 5,
            //     borderColor: const Color(0xFF3498DB),
            //     focusedBorderColor: const Color(0xFF3498DB),
            //     showFieldAsBox: true,
            //     margin: EdgeInsets.symmetric(
            //         horizontal: 15), // Add margin between fields
            //     onCodeChanged: (String code) {
            //       // Handle validation or checks here
            //     },
            //     onSubmit: (String verificationCode) {},
            //   ),
            // ),
            // SizedBox(
            //   height: screenDimensions.screenHeight * 0.02,
            // ), // Additional space
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     CustomTextButtonWidget(
            //       buttonText: TextButtonText.resendotp,
            //       fontSize: 12,
            //       onPressed: () {
            //         nextScreen(context, const Newpassword());
            //       },
            //       textcolor: AppColor.textbuttonColor,
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: screenDimensions.screenHeight * 0.05,
            // ),
            // PrimaryElevatedButtonWidget(
            //   onPressed: () {
            //     nextScreen(context, const Newpassword());
            //   },
            //   buttonText: ElevatedButtonText.verify,
            // ),
            // SizedBox(
            //   height: screenDimensions.screenHeight * 0.02,
            // ), // Additional space
          ],
        ),
      ),
    );
  }
}
