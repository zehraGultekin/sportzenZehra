import 'package:flutter/material.dart';
import 'package:sportzenzehra/feature/home/data/models/category_model.dart';

final List<CategoryModel> sportzenCards = [
  CategoryModel(
    title: "Kulüp Kayıt",
    subtitle: "Kulüplerin bir parçası olun",
    backgroundImage: "assets/images/tenniss.jpg",
    cardImage: Image.asset('assets/images/kayit.png'),
  ),
  CategoryModel(
    title: "Haberler",
    subtitle: "Bütün haberler burada",
    backgroundImage: "assets/images/saha.jpeg",
    cardImage: Image.asset('assets/images/newscard.png', height: 60),
  ),
];

final List<CategoryModel> applantisCards = [
  CategoryModel(
    title: "Turnuvalar",
    subtitle: "Katılabileceğiniz turnuvalar",
    backgroundImage: "assets/images/turnuva.png",
    cardImage: Image.asset('assets/images/league.png', height: 50, width: 50),
  ),
  CategoryModel(
    title: "Haberler",
    subtitle: "Bütün haberler burada",
    backgroundImage: "assets/images/saha.jpeg",
    cardImage: Image.asset('assets/images/newscard.png'),
  ),
];
