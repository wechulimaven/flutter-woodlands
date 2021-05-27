import 'package:flutter/material.dart';

class Product {
  String image;
  List<String> images;
  List<Color> colors;
  String name;
  String description;
  double price;
  double discountPercent;
  double rating;
  int id;

  Product({
    this.id,
    this.image,
    this.name,
    this.description,
    this.price,
    this.rating,
    this.discountPercent,
    this.images,
    this.colors,
  });

  double get originalPrice {
    return discountPercent != null
        ? (originalPrice - (originalPrice * discountPercent / 100))
        : originalPrice;
  }

  static String format(double price) {
    String money = price.toStringAsFixed(2);
    return '\$$money';
  }
}

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/bag_1.png",
      "assets/bag_2.png",
      "assets/bag_3.png",
      "assets/bag_4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    name: "Wireless Controller for PS4™",
    price: 64.99,
    description: description,
    rating: 4.8,
  ),
  Product(
    id: 2,
    images: [
      "assets/bag_1.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    name: "Nike Sport White - Man Pant",
    price: 50.5,
    description: description,
    rating: 4.1,
  ),
  Product(
    id: 3,
    images: [
      "assets/bag_2.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    name: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: description,
    rating: 4.1,
  ),
  Product(
    id: 4,
    images: [
      "assets/cap_1",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    name: "Logitech Head",
    price: 20.20,
    description: description,
    rating: 4.1,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
