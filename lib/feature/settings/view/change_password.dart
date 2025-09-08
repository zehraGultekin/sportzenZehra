import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/core/widgets/appbar.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: "Şifre Değiştir",
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: theme.colorScheme.secondary,
            size: 20,
          ),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Yeni Şifre", style: theme.textTheme.bodyMedium),
            SizedBox(height: 5),
            SizedBox(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  fillColor: AppColors.backgroundGrey,
                  filled: true,
                  hintText: "Yeni Şifrenizi Girin",
                  hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 14,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.grey.withValues(alpha: 0.2),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.grey.withValues(alpha: 0.2),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text("Yeni Şifre (Tekrar)", style: theme.textTheme.bodyMedium),
            SizedBox(height: 5),
            SizedBox(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  fillColor: AppColors.backgroundGrey,
                  filled: true,
                  hintText: "Yeni Şifrenizi tekrar girin",
                  hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 14,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.grey.withValues(alpha: 0.2),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.grey.withValues(alpha: 0.2),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 5),
                    Text(
                      "Şifreyi Değiştir",
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
