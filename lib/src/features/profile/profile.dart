import 'package:flutter/material.dart';
import 'package:genzo/src/commons/widgets/custom_appbar.dart';
import 'package:genzo/src/commons/widgets/custom_textbutton_widget.dart';
import 'package:genzo/src/core/navigation_service/navigation_service.dart';
import 'package:genzo/src/features/auth_screens/create_account/create_account.dart';
import 'package:genzo/src/res/colors.dart';
import 'package:genzo/src/utils/screen_dimensions.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenDimensions screenDimensions = ScreenDimensions(context);
    return Scaffold(
      appBar: CustomAppBar(
        customTextButton: CustomTextButtonWidget(
          buttonText: 'Back',
          fontSize: 14,
          onPressed: () {
            Navigator.pop(context);
          },
          textcolor: AppColor.textbuttonColor,
        ),
        staticText: 'Profile',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenDimensions.screenHeight * 0.05,
          ),
          CircleAvatar(
            minRadius: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'assets/images/png/topgenzo4.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: screenDimensions.screenHeight * 0.02,
          ),
          const Center(
            child: Text(
              'Aman Singh',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Center(
            child: Text(
              'aksingh230502@gmail.com',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(
            height: screenDimensions.screenHeight * 0.02,
          ),
          const Divider(
            height: 1,
          ),
          ListTile(
            leading: const Icon(Icons.payment_outlined),
            title: const Text('Payment History'),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward_ios_rounded),
              onPressed: () {},
            ),
          ),
          const Divider(
            height: 1,
          ),
          const Divider(
            height: 1,
          ),
          ListTile(
            leading: const Icon(Icons.save_outlined),
            title: const Text('Wishlisted Course'),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward_ios_outlined),
              onPressed: () {},
            ),
          ),
          const Divider(
            height: 1,
          ),
          const Divider(
            height: 1,
          ),
          ListTile(
            leading: const Icon(Icons.comment_bank_outlined),
            title: const Text('Your Comments'),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward_ios_outlined),
              onPressed: () {},
            ),
          ),
          const Divider(
            height: 1,
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text('Logout'),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward_ios_rounded),
              onPressed: () {
                nextScreen(context, const CreateAccount());
              },
            ),
          ),
          const Divider(
            height: 1,
          ),
        ],
      ),
    );
  }
}