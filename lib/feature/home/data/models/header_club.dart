class HeaderModel {
  final String name;
  final String logoPath;

  HeaderModel({required this.name, required this.logoPath});
}

final clubList = [
  HeaderModel(name: "Sporzen Public", logoPath: "assets/images/logo.png"),
  HeaderModel(
    name: "Applantis Tenis Kulübü",
    logoPath: "assets/images/newlogo.png",
  ),
];
