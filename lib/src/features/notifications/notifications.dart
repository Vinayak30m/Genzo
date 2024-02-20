import 'package:flutter/material.dart';
import 'package:genzo/src/commons/widgets/custom_appbar.dart';
import 'package:genzo/src/commons/widgets/custom_textbutton_widget.dart';
import 'package:genzo/src/res/colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        customTextButton: CustomTextButtonWidget(
          buttonText: 'Back',
          fontSize: 12,
          onPressed: () {
            Navigator.pop(context);
          },
          textcolor: AppColor.textbuttonColor,
        ),
        staticText: 'Notifications',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/png/notification.png'),
            SizedBox(
              height: 10,
            ),
            Text(
              textAlign: TextAlign.center,
              'Your learning journey awaits, begin it with a beautiful smile 😊',
              style: TextStyle(
                color: AppColor.primaryColor.withOpacity(0.5),
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}