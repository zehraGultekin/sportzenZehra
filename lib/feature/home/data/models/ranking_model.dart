import 'package:flutter/material.dart';

class RankingItem {
  final int rank;
  final String name;
  final Color? tagColor;
  final String? tagText;
  final IconData? tagIcon;
  final bool isCurrentUser;

  RankingItem({
    required this.rank,
    required this.name,
    this.tagColor,
    this.tagText,
    this.tagIcon,
    this.isCurrentUser = false,
  });
}
