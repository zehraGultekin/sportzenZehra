import 'package:flutter/material.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/feature/home/data/mock/ranking_list.dart';
import 'package:sportzenzehra/feature/home/view/tournament/ranking_item_extensions.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: rankingList.map((item) {
            final showTag = item.tagText != null && item.tagColor != null;
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
              decoration: BoxDecoration(
                color: item.isCurrentUser
                    ? AppColors.blue.withValues(alpha: 0.03)
                    : theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(12.0),
                border: item.isCurrentUser
                    ? Border.all(color: AppColors.blue, width: 1.5)
                    : null,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: item.rankCircleColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        item.rank.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: item.rankTextColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: item.isCurrentUser
                          ? Colors.blue.shade700
                          : Colors.black,
                    ),
                  ),
                  const Spacer(),
                  if (showTag)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: item.tagColor!.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(
                          item.isCurrentUser ? 12 : 20,
                        ),
                      ),
                      child: Row(
                        children: [
                          if (item.tagIcon != null) ...[
                            Icon(item.tagIcon, color: item.tagColor, size: 14),
                            SizedBox(width: 4),
                          ],
                          Text(
                            item.tagText!,
                            style: TextStyle(
                              color: item.tagColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
