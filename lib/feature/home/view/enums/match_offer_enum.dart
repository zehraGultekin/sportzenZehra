import 'package:flutter/material.dart';

enum MatchOffer { all, mine }

extension MatchOfferExtension on MatchOffer {
  String get title {
    switch (this) {
      case MatchOffer.all:
        return 'Tüm Maç Teklifleri';
      case MatchOffer.mine:
        return 'Benim Maç Tekliflerim';
    }
  }

  IconData get icon {
    switch (this) {
      case MatchOffer.all:
        return Icons.calendar_month_rounded;
      case MatchOffer.mine:
        return Icons.person;
    }
  }
}
