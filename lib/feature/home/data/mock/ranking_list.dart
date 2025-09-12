import 'package:flutter/material.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/feature/home/data/models/ranking_model.dart';

final List<RankingItem> rankingList = [
  RankingItem(
    rank: 1,
    name: 'Hamza Fatih Zengin',
    tagColor: AppColors.secondary,
    tagText: 'Maç Teklifi',
    tagIcon: Icons.sports_baseball,
  ),
  RankingItem(
    rank: 2,
    name: 'Ahmet Şahin',
    tagColor: AppColors.error,
    tagText: 'Müsait Değil',
    tagIcon: Icons.sports_baseball,
  ),
  RankingItem(
    rank: 3,
    name: 'Zehra Gültekin',
    isCurrentUser: true,
    tagColor: AppColors.blue,
    tagText: 'Siz',
  ),
  RankingItem(rank: 4, name: 'Yusuf Boga'),
  RankingItem(rank: 5, name: 'Sporzen Test'),
];
