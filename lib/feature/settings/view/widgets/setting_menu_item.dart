import 'package:flutter/material.dart';

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
    final theme = TextTheme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey),
            SizedBox(width: 10),
            Text(
              title,
              style: theme.labelSmall?.copyWith(
                color: colors,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
