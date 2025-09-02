import 'package:flutter/material.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';

class SettingsMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? colors;

  const SettingsMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Icon(icon, color: AppColors.grey),
            SizedBox(width: 10),
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(color: colors),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.grey),
          ],
        ),
      ),
    );
  }
}
