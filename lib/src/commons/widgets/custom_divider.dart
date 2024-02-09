import 'package:flutter/material.dart';

class CustomDividerTextWidget extends StatelessWidget {
  final String text;

  const CustomDividerTextWidget({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pw = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: pw * 0.388,
          child: const Divider(
            color: Colors.black,
          ),
        ),
        SizedBox(
          width: pw * 0.01,
        ),
        Flexible(
          child: Text(
            text,
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02),
          ),
        ),
        SizedBox(
          width: pw * 0.01,
        ),
        SizedBox(
          width: pw * 0.388,
          child: const Divider(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
