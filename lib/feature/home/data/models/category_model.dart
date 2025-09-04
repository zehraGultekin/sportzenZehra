class CategoryModel {
  final String title;
  final String subtitle;
  final String backgroundImage;
  final String cardImage;

  CategoryModel({
    required this.cardImage,
    required this.subtitle,
    required this.title,
    required this.backgroundImage,
  });
}

final List<CategoryModel> cardItems = [
  CategoryModel(
    subtitle: "Kulüplerin bir parçası olun",
    title: "Kulüp Kayıt",
    backgroundImage: "assets/images/tenniss.jpg",
    cardImage: 'assets/images/kayit.png',
  ),
  CategoryModel(
    subtitle: "Bütün haberler burada",
    title: "Haberler",
    backgroundImage: "assets/images/saha.jpeg",
    cardImage: 'assets/images/kayit.png',
  ),
];
