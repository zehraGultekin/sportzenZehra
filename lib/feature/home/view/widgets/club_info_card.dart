import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';

class ClubInfoCard extends StatelessWidget {
  final String clubLogo;
  final String title;
  final String subtitle;

  const ClubInfoCard({
    super.key,
    required this.clubLogo,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.backgroundGrey,
        border: Border.all(color: AppColors.opacitygrey),
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 35, backgroundImage: AssetImage(clubLogo)),
          SizedBox(width: 10),
          Column(
            spacing: 3,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/futbol.svg',
                    width: 20,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                      AppColors.black70,
                      BlendMode.srcIn,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/tenis.svg',
                    width: 22,
                    height: 22,
                    colorFilter: ColorFilter.mode(
                      AppColors.black70,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
              Text(
                subtitle,
                style: theme.textTheme.bodySmall?.copyWith(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
