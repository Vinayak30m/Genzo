import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:genzo/src/core/navigation_service/navigation_service.dart';
import 'package:genzo/src/features/home/carousel_description/carousel_data.dart';
import 'package:genzo/src/features/home/subviews/carousel_description_screen.dart';
import 'package:genzo/src/res/colors.dart';

class HomeCarouselWidget extends StatefulWidget {
  const HomeCarouselWidget({super.key});

  @override
  State<HomeCarouselWidget> createState() => _HomeCarouselWidgetState();
}

class _HomeCarouselWidgetState extends State<HomeCarouselWidget> {
  Widget build(BuildContext context) {
    return BannerCarousel(
      width: double.infinity,
      banners: BannerImage.listBanners,
      activeColor: AppColor.primaryColor,
      animation: true,
      margin: EdgeInsets.zero,
      spaceBetween: 3,
      onTap: (id) {
        BannerModel? banner = BannerImage.listBanners.firstWhere(
          (banner) => banner.id == id,
        );
        if (banner != null) {
          nextScreen(
            context,
            CarouselDescriptionScreen(carouselImage: banner.imagePath, id: id),
          );
        }
      },
    );
  }
}
