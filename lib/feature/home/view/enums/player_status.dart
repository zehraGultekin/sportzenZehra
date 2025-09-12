import 'package:flutter/material.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';

enum PlayerStatus { avaible, unavailable, isYou, busy }

extension PlayerStatusHelper on PlayerStatus {
  bool get isClick {
    switch (this) {
      case PlayerStatus.avaible:
        return true;
      case PlayerStatus.unavailable:
        return false;
      case PlayerStatus.isYou:
        return false;
      case PlayerStatus.busy:
        return false;
    }
  }

  Color cardColor(BuildContext context) {
    final theme = Theme.of(context);
    switch (this) {
      case PlayerStatus.isYou:
        return AppColors.blue;
      case PlayerStatus.avaible:
        return theme.colorScheme.secondary;
      case PlayerStatus.unavailable:
        return theme.colorScheme.surface;
      case PlayerStatus.busy:
        return theme.colorScheme.error;
    }
  }

  Color getTextColor(BuildContext context) {
    switch (this) {
      case PlayerStatus.unavailable:
        return AppColors.black40;
      default:
        return Colors.white;
    }
  }

  Border? getBorder(BuildContext context) {
    if (this == PlayerStatus.unavailable) {
      return Border.all(color: Colors.grey.shade300);
    }
    return null;
  }
}
