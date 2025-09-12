import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';

class EmptyStateWidget extends StatelessWidget {
  final String iconPath;
  final String message;

  const EmptyStateWidget({
    super.key,
    required this.iconPath,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.grey.withValues(alpha: 0.15),
            ),
            child: SvgPicture.asset(
              iconPath,
              width: 40,
              height: 40,
              colorFilter: ColorFilter.mode(
                theme.colorScheme.onSecondary,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            message,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium?.copyWith(
              color: AppColors.black70,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
