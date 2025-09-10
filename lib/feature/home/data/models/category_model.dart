import 'package:flutter/widgets.dart';

class CategoryModel {
  final String title;
  final String subtitle;
  final String backgroundImage;
  final Widget cardImage;

  CategoryModel({
    required this.cardImage,
    required this.subtitle,
    required this.title,
    required this.backgroundImage,
  });
}
