import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:genzo/src/commons/widgets/custom_textbutton_widget.dart';
import 'package:genzo/src/core/navigation_service/navigation_service.dart';
import 'package:genzo/src/features/auth_screens/forgot_password/forgot_password.dart';
import 'package:genzo/src/features/auth_screens/providers/sign_in_provider.dart';
import 'package:genzo/src/features/home/homescreen.dart';
import 'package:genzo/src/res/assets.dart';
import 'package:genzo/src/res/strings.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
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
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final RoundedLoadingButtonController googleController =
      RoundedLoadingButtonController();
  final SignInProvider signInProvider = SignInProvider();
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
                hintText: TextFieldHint.emailHint,
                showPasswordIcon: false,
                controller: _emailTextController,
              ),
              SizedBox(
                height: screenDimensions.screenHeight * 0.015,
              ),
              CustomTextformfield(
                hintText: TextFieldHint.passwordHint,
                isObscured: true,
                controller: _passwordTextController,
              ),
              SizedBox(
                height: screenDimensions.screenHeight * 0.040,
              ),
              PrimaryElevatedButtonWidget(
                  onPressed: () {
                    EasyLoading.show(status: 'verifying');
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      EasyLoading.dismiss();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    }).onError((error, stackTrace) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('An error occured. Please try again.'),
                        ),
                      );
                    });
                  },
                  buttonText: ElevatedButtonText.signin),
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
                  onPressed: () {
                    signInProvider.signInWithGoogle();
                  },
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
