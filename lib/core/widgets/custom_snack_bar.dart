import 'package:flutter/material.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';

class CustomSnackBar extends StatelessWidget {
  final String message;
  final Color iconColor;
  final Color borderColor;

  const CustomSnackBar({
    super.key,
    required this.message,
    required this.iconColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      elevation: 5,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(Icons.info, color: iconColor),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              child: Text(
                "Kapat",
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.black70,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
