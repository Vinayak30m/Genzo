import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:genzo/src/core/models/cart_attributes.dart';

class CartProvider extends ChangeNotifier {
  Map<String, CartAttr> _cartItems = {};


double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.coursePrice;
    });
    return total;
  }
  
  Map<String, CartAttr> get getCartItems {
    return {..._cartItems};
  }

  void addToCart(
    String courseId,
    String courseTitle,
    String tutorName,
    String courseDescription,
    String imageUrl,
    String videoUrl,
    List videoUrlList,
    double courseDuration,
    double coursePrice,
    Timestamp createdAt,
  ) {
    if (_cartItems.containsKey(courseId)) {
      _cartItems.update(
        courseId,
        (existingCartItem) => CartAttr(
          courseId: existingCartItem.courseId,
          courseTitle: existingCartItem.courseTitle,
          tutorName: existingCartItem.tutorName,
          courseDescription: existingCartItem.courseDescription,
          imageUrl: existingCartItem.imageUrl,
          videoUrl: existingCartItem.videoUrl,
          videoUrlList: existingCartItem.videoUrlList,
          courseDuration: existingCartItem.courseDuration,
          coursePrice: existingCartItem.coursePrice,
          createdAt: existingCartItem.createdAt,
        ),
      );
      notifyListeners();
    } else {
      _cartItems.putIfAbsent(
        courseId,
        () => CartAttr(
          courseId: courseId,
          courseTitle: courseTitle,
          tutorName: tutorName,
          courseDescription: courseDescription,
          imageUrl: imageUrl,
          videoUrl: videoUrl,
          videoUrlList: videoUrlList,
          courseDuration: courseDuration,
          coursePrice: coursePrice,
          createdAt: createdAt,
        ),
      );
    }
    notifyListeners();
  }

  removeItem(String courseId) {
    _cartItems.remove(courseId);
    notifyListeners();
  }

  clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
