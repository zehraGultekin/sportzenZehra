import 'package:flutter/material.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/feature/home/data/models/ranking_model.dart';

extension RankingItemUI on RankingItem {
  Color get rankCircleColor {
    if (isCurrentUser) {
      return Colors.brown.shade100;
    }
    switch (rank) {
      case 1:
        return Colors.yellow.shade100;

      default:
        return AppColors.black10;
    }
  }

  Color get rankTextColor {
    if (isCurrentUser) {
      return Colors.brown;
    }
    switch (rank) {
      case 1:
        return Colors.orange.shade800;
      case 2:
        return Colors.grey.shade700;
      default:
        return AppColors.black50;
    }
  }
}
