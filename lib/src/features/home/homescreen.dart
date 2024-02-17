import 'dart:async';

import 'package:flutter/material.dart';
import 'package:genzo/src/features/categories/category_widget.dart';
import 'package:genzo/src/features/home/carousel_description/banner_widget.dart';
import 'package:genzo/src/features/home/subviews/quotes_services/quotes_data.dart';
import 'package:genzo/src/features/home/subviews/search_bar/custom_search_box.dart';
import 'package:genzo/src/features/home/widgets/categorybox_widget.dart';
import 'package:genzo/src/features/home/widgets/home_appbar.dart';
import 'package:genzo/src/features/home/widgets/top_genzos_card.dart';
import 'package:genzo/src/features/home/widgets/unique_pick_card_widget.dart';
import 'package:genzo/src/utils/screen_dimensions.dart';

import '../categories/model/course_model/course_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  late Stream<String> _quoteStream;
  late StreamSubscription<String> _quoteSubscription;
  late String _currentQuote =
      'With the power of technology at our fingertips, we can connect and inspire worldwide';

  late Timer _scrollTimer;
  int _currentPageIndex = 0;
  final List<CourseModel> _courses = [
    CourseModel(
        thumbnailimage: 'assets/images/png/uniquepickcard1.png',
        title: 'Mind Mastery',
        subtitle: 'The art of reading minds',
        description:
            'Uncover hidden thoughts with mind whisperer: The art of mind reading',
        coursereach: '5k since published🔥',
        price: 'Rs. 299'),
    CourseModel(
        thumbnailimage: 'assets/images/png/uniquepickcard1.png',
        title: 'Mind Mastery',
        subtitle: 'The art of reading minds',
        description:
            'Uncover hidden thoughts with mind whisperer: The art of mind reading',
        coursereach: '5k since published🔥',
        price: 'Rs. 299'),
    CourseModel(
        thumbnailimage: 'assets/images/png/uniquepickcard1.png',
        title: 'Mind Mastery',
        subtitle: 'The art of reading minds',
        description:
            'Uncover hidden thoughts with mind whisperer: The art of mind reading',
        coursereach: '5k since published🔥',
        price: 'Rs. 299'),
  ];

  @override
  void initState() {
    super.initState();
    _quoteStream = QuoteService.getQuoteStream();
    _quoteSubscription = _quoteStream.listen((quote) {
      setState(() {
        _currentQuote = quote;
      });
    });
    _pageController = PageController();

    _scrollTimer = Timer.periodic(Duration(seconds: 10), (timer) {
      _scrollToNext();
    });
  }

  @override
  void dispose() {
    _quoteSubscription.cancel();
    _pageController.dispose();
    _scrollTimer.cancel();
    super.dispose();
  }

  void _scrollToNext() {
    if (_currentPageIndex < _courses.length - 1) {
      _currentPageIndex++;
      _pageController.animateToPage(
        _currentPageIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      _currentPageIndex = 0;
      _pageController.animateToPage(
        _currentPageIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenDimensions screenDimensions = ScreenDimensions(context);
    return SafeArea(
      child: Scaffold(
        appBar: const HomeAppBarWidget(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BannerWidget(),
                SizedBox(
                  height: screenDimensions.screenHeight * 0.01,
                ),
                Center(
                  child: Container(
                    height: screenDimensions.screenHeight * 0.08,
                    color: Colors.transparent,
                    child: Text(
                      _currentQuote,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: screenDimensions.screenHeight * 0.01,
                ),
                const CustomSearchBox(
                    hintText: 'search categories, courses or skills'),
                SizedBox(
                  height: screenDimensions.screenHeight * 0.01,
                ),
                const Text(
                  'Menu',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: screenDimensions.screenHeight * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CategoryBoxWidget(
                      image: 'assets/images/png/skills_illus.png',
                      text: 'Skills',
                      onPressed: () {},
                    ),
                    CategoryBoxWidget(
                      image: 'assets/images/png/myskills_illus.png',
                      text: 'My Skills',
                      onPressed: () {},
                    ),
                    CategoryBoxWidget(
                      image: 'assets/images/png/progress_illus.png',
                      text: 'Progress',
                      onPressed: () {},
                    ),
                    CategoryBoxWidget(
                      image: 'assets/images/png/profile_illus.png',
                      text: 'Profile',
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: screenDimensions.screenHeight * 0.01,
                ),
                const Text(
                  'Skills On Trend 🔥',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: screenDimensions.screenHeight * 0.01,
                ),
                const CategoryWidget(),
                SizedBox(
                  height: screenDimensions.screenHeight * 0.01,
                ),
                const Text(
                  'Unique Picks',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: screenDimensions.screenHeight *
                      0.12, // Adjust the height as needed
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _courses.length,
                    itemBuilder: (context, index) {
                      return UniquePicksCardWidget(course: _courses[index]);
                    },
                  ),
                ),
                SizedBox(
                  height: screenDimensions.screenHeight * 0.01,
                ),
                const Text(
                  'Top Genzos',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TopGenzosCardWidget(
                        image: 'assets/images/png/topgenzo1.png',
                        name: 'Mr. Bhau Kadam',
                        profession: 'Actor, Comedian',
                      ),
                      TopGenzosCardWidget(
                        image: 'assets/images/png/topgenzo2.png',
                        name: 'Sri Sri Ravi Shankar',
                        profession: 'Spritual, Yoga Guru',
                      ),
                      TopGenzosCardWidget(
                        image: 'assets/images/png/topgenzo3.png',
                        name: 'Ajay and Atul',
                        profession: 'Music Composer',
                      ),
                      TopGenzosCardWidget(
                        image: 'assets/images/png/topgenzo4.png',
                        name: 'Mr. Aman Kumar',
                        profession: 'Self Care',
                      ),
                      TopGenzosCardWidget(
                        image: 'assets/images/png/topgenzo5.png',
                        name: 'Mr. Vinayak Mishra',
                        profession: 'Digital Wellness',
                      ),
                      TopGenzosCardWidget(
                        image: 'assets/images/png/topgenzo6.png',
                        name: 'Mr. Sairaj Kulkarni',
                        profession: 'Rapper and freestyle',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
