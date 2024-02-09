import 'package:flutter/material.dart';

class Authicon extends StatelessWidget {
  final String icon1;
  final String icon2;
  final String icon3;

  Authicon({
    required this.icon1,
    required this.icon2,
    required this.icon3,
  });

  @override
  Widget build(BuildContext context) {
    
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: Image.asset(icon1)),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Flexible(child: Image.asset(icon2)),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Flexible(child: Image.asset(icon3)),
        ],
      ),
    );
  }
}