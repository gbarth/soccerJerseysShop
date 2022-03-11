import 'package:flutter/cupertino.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imagePath;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imagePath,
    this.isFavorite = false,
  });

  void toogleFavorite() {
    isFavorite = !isFavorite;
  }
}
