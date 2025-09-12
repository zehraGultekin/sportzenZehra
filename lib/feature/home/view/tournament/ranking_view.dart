import 'package:flutter/material.dart';
import 'package:sportzenzehra/feature/home/data/mock/ranking_list.dart';
import 'package:sportzenzehra/feature/home/view/tournament/widgets/ranking_card.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: rankingList.map((item) {
            final showTag = item.tagText != null && item.tagColor != null;
            return RankingCard(showTag: showTag, item: item);
          }).toList(),
        ),
      ),
    );
  }
}
