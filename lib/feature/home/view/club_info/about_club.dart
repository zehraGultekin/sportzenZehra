import 'package:flutter/material.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/feature/home/view/widgets/build_sport_box.dart';

class AboutClubView extends StatelessWidget {
  const AboutClubView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: SingleChildScrollView(
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.backgroundGrey,
                border: Border.all(
                  color: AppColors.grey.withValues(alpha: 0.2),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                "assets/images/applantistenis.jpg",
                fit: BoxFit.fitHeight,
              ),
            ),
            Text(
              "Applantis Tenis Kulübü 2025 yılında Adana'da\nkurulmuştur. Uygun fiyatlı kortları ve konforlu\ntesisleriyle tenis severlere hizmet vermektedir.",
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.black80,
                fontWeight: FontWeight.w500,
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Branşlar",
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildSportBox(Icons.sports_tennis, "Tenis"),
                      const SizedBox(width: 10),
                      buildSportBox(Icons.sports_football_rounded, "Futbol"),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              "Özellikler",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/images/parklogo.png"),
                  ),
                  Text(
                    "Park",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: theme.colorScheme.error,
              ),
              alignment: Alignment.center,
              child: Text(
                "Kulüpten Ayrıl",
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
