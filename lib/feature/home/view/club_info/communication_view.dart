import 'package:flutter/material.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';

class CommunicationView extends StatelessWidget {
  const CommunicationView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.backgroundGrey,
              border: Border.all(color: AppColors.grey.withValues(alpha: 0.2)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                spacing: 5,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.phone, size: 18, color: AppColors.black70),
                      Text(
                        "+902129631342",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.black70,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.mail, size: 18),
                      Text(
                        "info@applantis.net",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.black70,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.location_pin, size: 18),
                      Text(
                        "Applantis",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.black70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
