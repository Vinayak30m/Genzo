import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:genzo/src/utils/screen_dimensions.dart';

import '../../../res/colors.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final List _bannerImage = [];

  getBanners() {
    return _firestore
        .collection('banners')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        setState(() {
          _bannerImage.add(doc['image']);
        });
      }
    });
  }

  int _currentPage = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    getBanners();
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      return setState(() {
        if (_currentPage < _bannerImage.length) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenDimensions screenDimensions = ScreenDimensions(context);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: screenDimensions.screenHeight * 0.195,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: PageView.builder(
          controller: _pageController,
          itemCount: _bannerImage.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Handle onTap event here
                // You can navigate to a detail screen or perform any other action
                print('Banner tapped: ${_bannerImage[index]}');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child:
                        Image.network(_bannerImage[index], fit: BoxFit.cover)),
              ),
            );
          },
        ),
      ),
    );
  }
}
