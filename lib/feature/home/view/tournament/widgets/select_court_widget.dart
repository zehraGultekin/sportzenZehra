import 'package:flutter/material.dart';

class CourtCard extends StatelessWidget {
  final Color iconColor;
  final String courtName;
  final String surfaceType;
  final Color surfaceColor;

  const CourtCard({
    super.key,
    required this.iconColor,
    required this.courtName,
    required this.surfaceType,
    required this.surfaceColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black.withOpacity(0.04)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: surfaceColor,
            child: Icon(
              Icons.sports_baseball_rounded,
              size: 20,
              color: iconColor,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            courtName,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: surfaceColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              surfaceType,
              style: theme.textTheme.bodySmall?.copyWith(
                color: iconColor,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
