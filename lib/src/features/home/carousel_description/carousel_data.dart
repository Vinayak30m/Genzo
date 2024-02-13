import 'package:banner_carousel/banner_carousel.dart';

class BannerImage {
  static const carousel1 = 'assets/images/jpg/carousel_image1.jpg';
  static const carousel2 = 'assets/images/jpg/carousel_image2.jpg';
  static const carousel3 = 'assets/images/jpg/carousel_image3.jpg';
  static const carousel4 = 'assets/images/jpg/carousel_image4.jpg';
  static const carousel5 = 'assets/images/jpg/carousel_image5.jpg';

  static List<BannerModel> listBanners = [
    BannerModel(imagePath: carousel1, id: "1"),
    BannerModel(imagePath: carousel2, id: "2"),
    BannerModel(imagePath: carousel3, id: "3"),
    BannerModel(imagePath: carousel4, id: "4"),
    BannerModel(imagePath: carousel5, id: "5"),
  ];


  
}
