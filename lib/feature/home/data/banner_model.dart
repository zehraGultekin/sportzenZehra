class BannerModel {
  final String title;
  final String imagePath;

  BannerModel({required this.title, required this.imagePath});
}

final List<BannerModel> bannerItems = [
  BannerModel(title: "Sponsor", imagePath: "assets/images/banner.png"),
];
