import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/core/widgets/appbar.dart';

class TournametView extends StatelessWidget {
  const TournametView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: "Turnuvalar",
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).colorScheme.secondary,
            size: 20,
          ),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                border: Border.all(
                  color: AppColors.grey.withValues(alpha: 0.2),
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 15,
                    spreadRadius: -2,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("test", style: theme.textTheme.titleMedium),
                      Spacer(),
                      Container(
                        height: 20,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: theme.colorScheme.secondary.withValues(
                            alpha: 0.2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Aktif",
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.secondary,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    spacing: 7,
                    children: [
                      Icon(
                        Icons.sports_baseball_outlined,
                        color: AppColors.blue,
                        size: 17,
                      ),
                      Text(
                        "Tenis",
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.black60,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.sports, color: AppColors.blue, size: 20),
                      Text(
                        "Defi Single",
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.black60,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    spacing: 5,
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        color: AppColors.blue,
                        size: 16,
                      ),
                      Text(
                        "18.07.2025 - 18.07.2026",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.black60,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Tüm turnuvalar görüntülenmiştir",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.black50,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
