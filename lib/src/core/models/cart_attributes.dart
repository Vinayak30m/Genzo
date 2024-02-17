import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CartAttr with ChangeNotifier {
  final String courseId;
  final String courseTitle;
  final String tutorName;
  final String courseDescription;
  final String imageUrl;
  final String videoUrl;
  final List videoUrlList;
  final double courseDuration;
  final double coursePrice;
  Timestamp createdAt;

  CartAttr(
      {required this.courseId,
      required this.courseTitle,
      required this.tutorName,
      required this.courseDescription,
      required this.imageUrl,
      required this.videoUrl,
      required this.videoUrlList,
      required this.courseDuration,
      required this.coursePrice,
      required this.createdAt});
}
