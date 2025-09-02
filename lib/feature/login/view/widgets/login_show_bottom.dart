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
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 20),
            TextField(
              cursorColor: AppColors.grey,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColors.grey.withValues(alpha: 0.4),
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.grey, width: 2),
                ),
                filled: true,
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                labelText: "E posta",
                labelStyle: AppTextStyles.inputhintstyle.copyWith(
                  color: AppColors.grey,
                ),

                suffixIcon: Icon(
                  Icons.mail_outline_outlined,
                  color: AppColors.grey,
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
                  color: Theme.of(context).primaryColor,
                ),
                child: Center(
                  child: Text(
                    "Gönder",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
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
