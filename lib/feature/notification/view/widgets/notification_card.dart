import 'package:flutter/material.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String clock;
  final String date;

  const NotificationCard({
    super.key,
    required this.theme,
    required this.title,
    required this.subtitle,
    required this.clock,
    required this.date,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.backgroundGrey,
        border: Border.all(color: AppColors.grey.withValues(alpha: 0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                CircleAvatar(
                  backgroundColor: theme.scaffoldBackgroundColor,
                  radius: 15,
                  backgroundImage: AssetImage("assets/images/logo.png"),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              subtitle,
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.black80,
              ),

              textAlign: TextAlign.start,
            ),
            SizedBox(height: 5),
            Row(
              spacing: 3,
              children: [
                Icon(Icons.schedule, color: Colors.grey, size: 13),
                Text(
                  clock,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
                Icon(Icons.calendar_today, color: Colors.grey, size: 15),
                Text(
                  date,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
