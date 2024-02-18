import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:genzo/src/core/navigation_service/navigation_service.dart';
import 'package:genzo/src/features/notifications/notifications.dart';
import 'package:genzo/src/features/user_profile/user_profile_screen.dart';
import 'package:genzo/src/res/colors.dart';

const defaultProfileIcon = Icons.account_circle;

Widget buildLeadingWidget(String imageUrl) {
  if (imageUrl != null && imageUrl.isNotEmpty) {
    return CircleAvatar(
      backgroundColor: AppColor.primaryColor,
      backgroundImage: AssetImage('assets/images/png/topgenzo4.png'),
    );
  } else {
    return const CircleAvatar(
      minRadius: 2,
      backgroundColor: AppColor.secondaryelevatedButtonColor,
      child: Icon(
        Icons.account_circle_sharp,
        color: Colors.black,
        size: 35,
      ),
    );
  }
}

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: AppBar(
        leading: buildLeadingWidget('assets/images/png/topgenzo4.png'),
        title: GestureDetector(
          onTap: () {
            nextScreen(context, UserProfileScreen());
          },
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              Text(
                'Aman Singh',
                style: TextStyle(color: AppColor.primaryColor, fontSize: 16),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                nextScreen(context, NotificationsScreen());
              },
              icon: const Icon(Icons.notifications_none_outlined)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.translate_rounded)),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
