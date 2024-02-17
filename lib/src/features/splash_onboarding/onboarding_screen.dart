import 'package:flutter/material.dart';
import 'package:genzo/src/features/auth_screens/create_account/create_account.dart';
import 'package:genzo/src/res/colors.dart';

import '../../commons/widgets/custom_text_widget.dart';
import '../auth_screens/create_account/create_account_signup.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();

    // Redirect to LoginScreen after 2 seconds
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CreateAccount()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to LoginScreen when tapped
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Signup()),
        );
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                  'assets/images/png/upskilling_youth_illustration.png'),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: CustomTextWidget(
                  text: 'Empower, Explore, Evolve',
                  style: const TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 25,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    height: 1.1,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: CustomTextWidget(
                  text: 'Genzo, where skills and hobbies converge!',
                  style: const TextStyle(
                    color: Color(0xFF121212),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w200,
                    height: 1,
                  ),
                  fontSizefactor: 0.65,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
