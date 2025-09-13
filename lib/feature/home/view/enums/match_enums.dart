// Dosya Adı: match_enum.dart

import 'package:flutter/material.dart';

// 1. Enum tanımımız
enum Match { all, mine }

// 2. Enum'a .title ve .icon özelliklerini ekleyen extension
extension MatchExtension on Match {
  String get title {
    switch (this) {
      case Match.all:
        return 'Tüm Maçlar';
      case Match.mine:
        return 'Benim Maçlarım';
    }
  }

  IconData get icon {
    switch (this) {
      case Match.all:
        return Icons.calendar_month_rounded;
      case Match.mine:
        return Icons.person;
    }
  }
}
