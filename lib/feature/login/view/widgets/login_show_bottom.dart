import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/core/theme/text_style.dart';

class LoginShowBottom extends StatefulWidget {
  const LoginShowBottom({super.key});

  @override
  State<LoginShowBottom> createState() => _LoginShowBottomState();
}

class _LoginShowBottomState extends State<LoginShowBottom> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      height: 200,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "Şifre Yenileme",
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            TextField(
              cursorColor: AppColors.grey,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColors.grey.withValues(alpha: 0.2),
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.grey, width: 2),
                ),
                filled: true,
                fillColor: AppColors.backgroundGrey,
                labelText: "E-posta",
                labelStyle: AppTextStyles.labelMedium.copyWith(
                  color: AppColors.black70,
                ),

                suffixIcon: Icon(
                  Icons.mail_outline_outlined,
                  color: AppColors.black70,
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: theme.colorScheme.secondary,
                ),
                child: Center(
                  child: Text(
                    "Gönder",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
