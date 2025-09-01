import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/router/router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/core/theme/text_style.dart';
import 'package:sportzenzehra/feature/login/view/widgets/custom_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset("assets/images/login.png", fit: BoxFit.cover),
            ),
            Positioned.fill(
              child: Container(color: Colors.black.withValues(alpha: 0.9)),
            ),
            Positioned(
              left: 20,
              child: Image.asset(
                "assets/images/bayrak.png",
                height: 30,
                width: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: Column(
                children: [
                  Image.asset("assets/images/news.png", height: 200),
                  Text(
                    "Hoş Geldin",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: AppColors.grey,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        CustomTextField(
                          label: 'E posta',
                          suffixIcon: Icons.mail_outline_sharp,
                          obscureText: false,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          label: "Sifre",
                          suffixIcon: Icons.lock_outline_sharp,
                          obscureText: true,
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Şifreni mi unuttun?",
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: AppColors.grey),
                            ),
                            SizedBox(width: 4),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      height: 200,
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(height: 20),
                                            Text(
                                              "Şifre Yenileme",
                                              style: Theme.of(
                                                context,
                                              ).textTheme.headlineLarge,
                                            ),
                                            SizedBox(height: 20),
                                            TextField(
                                              cursorColor: AppColors.grey,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                    ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10,
                                                          ),
                                                      borderSide: BorderSide(
                                                        color: AppColors.grey
                                                            .withValues(
                                                              alpha: 0.4,
                                                            ),
                                                        width: 1.5,
                                                      ),
                                                    ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10,
                                                          ),
                                                      borderSide: BorderSide(
                                                        color: AppColors.grey,
                                                        width: 2,
                                                      ),
                                                    ),

                                                filled: true,
                                                fillColor: Theme.of(
                                                  context,
                                                ).scaffoldBackgroundColor,

                                                labelText: "E posta",
                                                labelStyle: AppTextStyles
                                                    .inputhintstyle
                                                    .copyWith(
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
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Theme.of(
                                                    context,
                                                  ).primaryColor,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Gönder",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headlineLarge
                                                        ?.copyWith(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Text(
                                "Yenile",
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.white,
                                      decorationThickness: 2,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {
                            context.goNamed(AppRoutes.home.name);
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
                                "Giriş Yap",
                                style: Theme.of(context).textTheme.headlineLarge
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Hesabın yok mu",
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: AppColors.grey),
                            ),
                            SizedBox(width: 4),
                            GestureDetector(
                              onTap: () {
                                context.goNamed(AppRoutes.register.name);
                              },
                              child: Text(
                                "Kayıt ol",
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.white,
                                      decorationThickness: 2,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: Text(
                            "Ya da",
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: AppColors.grey),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/google.png",
                                        height: 20,
                                        width: 20,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "Google ile giriş",
                                        style: AppTextStyles.inputhintstyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/apple.png",
                                        height: 20,
                                        width: 20,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "Apple ile giriş",
                                        style: AppTextStyles.inputhintstyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
