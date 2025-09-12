import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';

class RulesWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String rules;
  const RulesWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.rules,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.blue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(
                  imagePath,
                  width: 20,
                  height: 20,
                  colorFilter: const ColorFilter.mode(
                    AppColors.blue,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(width: 12),

              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          Text.rich(
            TextSpan(
              style: TextStyle(
                fontSize: 14,
                color: AppColors.black70,
                height: 1.5,
              ),
              children: [
                TextSpan(
                  text: '• ',
                  style: TextStyle(
                    fontSize: 24,
                    color: const Color(0xff2196f3),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: rules),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
