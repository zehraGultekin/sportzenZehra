enum ClubInfo { about, contact, rules }

extension ClubInfoExtension on ClubInfo {
  String get title {
    switch (this) {
      case ClubInfo.about:
        return "Hakkında";
      case ClubInfo.contact:
        return "İletişim";
      case ClubInfo.rules:
        return "Kurallar";
    }
  }
}
