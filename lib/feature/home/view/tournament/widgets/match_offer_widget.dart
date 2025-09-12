import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBack;
  final String title;
  final String date;
  final String time;
  final Color valueColor;

  const OfferCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.iconBack,
    required this.title,
    required this.date,
    required this.time,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: iconBack,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        const SizedBox(width: 10),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "$title\n",
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: "$date\n",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: valueColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(text: time, style: theme.textTheme.bodySmall),
            ],
          ),
        ),
      ],
    );
  }
}
