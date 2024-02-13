import 'package:flutter/material.dart';
import 'package:genzo/src/commons/widgets/custom_appbar.dart';
import 'package:genzo/src/commons/widgets/custom_textbutton_widget.dart';
import 'package:genzo/src/features/home/carousel_description/carousel_data/carousel_data.dart';
import 'package:genzo/src/features/home/carousel_description/model/carousel_info_model.dart';
import 'package:genzo/src/res/colors.dart';

class CarouselDescriptionScreen extends StatefulWidget {
  final String carouselImage;
  final String id;
  const CarouselDescriptionScreen(
      {required this.carouselImage, required this.id, super.key});

  @override
  State<CarouselDescriptionScreen> createState() =>
      _CarouselDescriptionScreenState();
}

class _CarouselDescriptionScreenState extends State<CarouselDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    CarouselInfoModel? info = carouselDescription.firstWhere(
      (info) => info.id == widget.id,
    );
    return Scaffold(
      appBar: CustomAppBar(
          staticText: 'Trendings',
          customTextButton: CustomTextButtonWidget(
            buttonText: 'Back',
            fontSize: 12,
            onPressed: () {},
            textcolor: AppColor.textbuttonColor,
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.asset(widget.carouselImage),
            ),
            Text(info.title),
            SizedBox(height: 10,),
            Text(info.description),
          ],
        ),
      ),
    );
  }
}
