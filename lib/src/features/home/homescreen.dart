import 'dart:async';

import 'package:flutter/material.dart';
import 'package:genzo/src/core/navigation_service/navigation_service.dart';
import 'package:genzo/src/features/categories/categories_screen.dart';
import 'package:genzo/src/features/home/data/skills/skills_data.dart';
import 'package:genzo/src/features/home/subviews/quotes_services/quotes_data.dart';
import 'package:genzo/src/features/home/subviews/search_bar/custom_search_box.dart';
import 'package:genzo/src/features/home/widgets/categorybox_widget.dart';
import 'package:genzo/src/features/home/widgets/home_appbar.dart';
import 'package:genzo/src/features/home/widgets/home_carousel.dart';
import 'package:genzo/src/utils/screen_dimensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Stream<String> _quoteStream;
  late StreamSubscription<String> _quoteSubscription;
  late String _currentQuote =
      'With the power of technology at our fingertips, we can connect and inspire worldwide';
  @override
  void initState() {
    super.initState();
    _quoteStream = QuoteService.getQuoteStream();
    _quoteSubscription = _quoteStream.listen((quote) {
      setState(() {
        _currentQuote = quote;
      });
    });
  }

  @override
  void dispose() {
    _quoteSubscription.cancel();
    super.dispose();
  }

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
                const HomeCarouselWidget(),
                SizedBox(
                  height: screenDimensions.screenHeight * 0.01,
                ),
                Center(
                  child: Container(
                    height: screenDimensions.screenHeight * 0.08,
                    color: Colors.transparent,
                    child: Text(
                      _currentQuote,
                      style: const TextStyle(fontSize: 16),
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
                // const Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     CategoryBoxWidget(
                //       image: 'assets/images/png/ayurveda_illus.png',
                //       text: 'Ayurveda',
                //     ),
                //     CategoryBoxWidget(
                //       image: 'assets/images/png/finance_illus.png',
                //       text: 'Finance',
                //     ),
                //     CategoryBoxWidget(
                //       image: 'assets/images/png/rituals_illus.png',
                //       text: 'Rituals',
                //     ),
                //     CategoryBoxWidget(
                //       image: 'assets/images/png/homeessential_illus.png',
                //       text: 'Home Essential',
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: screenDimensions.screenHeight * 0.01,
                // ),
                // const Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     CategoryBoxWidget(
                //       image: 'assets/images/png/genz_illus.png',
                //       text: 'Gen Z',
                //     ),
                //     CategoryBoxWidget(
                //       image: 'assets/images/png/automobile_illus.png',
                //       text: 'Automobiles',
                //     ),
                //     CategoryBoxWidget(
                //       image: 'assets/images/png/music_illus.png',
                //       text: 'Music',
                //     ),
                //     CategoryBoxWidget(
                //       image: 'assets/images/png/uniquehobbies_illus.png',
                //       text: 'Unique Hobbies',
                //     ),
                //   ],
                // ),
                Container(
                  height: 200,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 1 / 1.1,
                      ),
                      itemCount: skillData.length,
                      itemBuilder: (context, index) {
                        final skill = skillData[index];
                        return CategoryBoxWidget(
                          image: skill.image,
                          text: skill.categorytext,
                          onPressed: () {
                            print(skill.categorytext);
                            nextScreen(
                                context,
                                CategoriesScreen(
                                  categoryText: skill.categorytext,
                                ));
                          },
                        );
                      }),
                ),
                SizedBox(
                  height: screenDimensions.screenHeight * 0.01,
                ),
                const Text(
                  'Unique Picks',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: screenDimensions.screenHeight * 0.01,
                ),
                // UniquePicksCardWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
