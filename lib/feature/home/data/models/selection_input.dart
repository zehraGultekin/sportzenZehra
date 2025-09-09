import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';

class SelectionInputModel {
  static const String country = "Türkiye";

  static const List<String> cities = [
    "Adana",
    "Adıyaman",
    "Afyonkarahisar",
    "Ağrı",
    "Amasya",
    "Ankara",
    "Antalya",
    "Artvin",
    "Aydın",
    "Balıkesir",
    "Bilecik",
    "Bingöl",
    "Bitlis",
    "Bolu",
    "Burdur",
    "Bursa",
    "Çanakkale",
    "Çankırı",
    "Çorum",
    "Denizli",
    "Diyarbakır",
    "Edirne",
    "Elazığ",
    "Erzincan",
    "Erzurum",
    "Eskişehir",
    "Gaziantep",
    "Giresun",
    "Gümüşhane",
    "Hakkari",
    "Hatay",
    "Isparta",
    "Mersin",
    "İstanbul",
    "İzmir",
    "Kars",
    "Kastamonu",
    "Kayseri",
    "Kırklareli",
    "Kırşehir",
    "Kocaeli",
    "Konya",
    "Kütahya",
    "Malatya",
    "Manisa",
    "Kahramanmaraş",
    "Mardin",
    "Muğla",
    "Muş",
    "Nevşehir",
    "Niğde",
    "Ordu",
    "Rize",
    "Sakarya",
    "Samsun",
    "Siirt",
    "Sinop",
    "Sivas",
    "Tekirdağ",
    "Tokat",
    "Trabzon",
    "Tunceli",
    "Şanlıurfa",
    "Uşak",
    "Van",
    "Yozgat",
    "Zonguldak",
    "Aksaray",
    "Bayburt",
    "Karaman",
    "Kırıkkale",
    "Batman",
    "Şırnak",
    "Bartın",
    "Ardahan",
    "Iğdır",
    "Yalova",
    "Karabük",
    "Kilis",
    "Osmaniye",
    "Düzce",
  ];

  static List<BranchModel> branches = [
    BranchModel(
      name: "Tenis",
      icon: SvgPicture.asset(
        'assets/icons/tenis.svg',
        height: 24,
        width: 24,
        colorFilter: ColorFilter.mode(AppColors.black80, BlendMode.srcIn),
      ),
    ),
    BranchModel(
      name: "Futbol",
      icon: SvgPicture.asset(
        'assets/icons/futbol.svg',
        height: 24,
        width: 24,
        colorFilter: ColorFilter.mode(AppColors.black80, BlendMode.srcIn),
      ),
    ),
    BranchModel(
      name: "Basketbol",
      icon: SvgPicture.asset(
        'assets/icons/basketbol.svg',
        height: 24,
        width: 24,
        colorFilter: ColorFilter.mode(AppColors.black80, BlendMode.srcIn),
      ),
    ),
    BranchModel(
      name: "Voleybol",
      icon: SvgPicture.asset(
        'assets/icons/voleybol.svg',
        height: 24,
        width: 24,
        colorFilter: ColorFilter.mode(AppColors.black80, BlendMode.srcIn),
      ),
    ),
  ];
}

class BranchModel {
  final String name;
  final Widget icon;

  BranchModel({required this.name, required this.icon});
}
