import 'dart:async';

import 'package:flutter/material.dart';
import 'package:genzo/src/features/home/subviews/quotes_services/quotes_data.dart';
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
        appBar: HomeAppBarWidget(),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeCarouselWidget(),
              SizedBox(
                height: screenDimensions.screenHeight * 0.01,
              ),
              Center(
                child: Text(
                  _currentQuote,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
