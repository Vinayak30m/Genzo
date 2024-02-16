import 'package:flutter/material.dart';
import 'package:genzo/src/utils/screen_dimensions.dart';

class TopGenzosCardWidget extends StatefulWidget {
  final String image;
  final String name;
  final String profession;
  const TopGenzosCardWidget({required this.image, required this.name, required this.profession,super.key});

  @override
  State<TopGenzosCardWidget> createState() => _TopGenzosCardWidgetState();
}

class _TopGenzosCardWidgetState extends State<TopGenzosCardWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenDimensions screenDimensions = ScreenDimensions(context);
    return Container(
      color: Colors.white,
      height: screenDimensions.screenHeight * 0.19,
      width: screenDimensions.screenWidth * 0.3,
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenDimensions.screenHeight * 0.734 * 0.19,
              child: Image.asset(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: screenDimensions.screenHeight * 0.005,
            ),
            Center(
              child: Text(
                widget.name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: screenDimensions.screenHeight * 0.005,
            ),
            Center(
              child: Text(
                widget.profession,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
