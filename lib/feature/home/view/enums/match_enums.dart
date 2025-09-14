import 'package:flutter/material.dart';

enum MatchList { all, mine }

extension MatchExtension on MatchList {
  String get title {
    switch (this) {
      case MatchList.all:
        return 'Tüm Maçlar';
      case MatchList.mine:
        return 'Benim Maçlarım';
    }
  }

  IconData get icon {
    switch (this) {
      case MatchList.all:
        return Icons.calendar_month_rounded;
      case MatchList.mine:
        return Icons.person;
    }
  }
}
