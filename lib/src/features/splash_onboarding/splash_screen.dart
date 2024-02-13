import 'package:flutter/material.dart';

import '../../commons/widgets/custom_text_widget.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to another page after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CustomTextWidget(
              text: 'Genzo',
              style: const TextStyle(
                color: Color(0xFF3498DB),
                fontSize: 40,
                fontFamily: 'Oswald',
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Center(
            child: CustomTextWidget(
              text: 'Learn, Create, Genzo-fy!',
              style: const TextStyle(
                color: Color(0xFF3498DB),
                fontSize: 40,
                fontFamily: 'Oswald',
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
