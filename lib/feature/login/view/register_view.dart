import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/router/router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/feature/login/provider/register_provider.dart';
import 'package:sportzenzehra/feature/login/view/widgets/custom_text_field.dart';
import 'package:sportzenzehra/feature/login/view/widgets/register_showmodal.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
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
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Center(
                    child: Image.asset("assets/images/news.png", height: 200),
                  ),
                  Text(
                    "Kayıt Ol",
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
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                label: "Ad",
                                obscureText: false,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: CustomTextField(
                                label: "Soyad",
                                obscureText: false,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          label: "Kullanıcı Adı",
                          obscureText: false,
                        ),
                        SizedBox(height: 10),
                        CustomTextField(label: "E-Mail", obscureText: false),
                        SizedBox(height: 10),
                        CustomTextField(label: "Telefon", obscureText: false),
                        SizedBox(height: 10),
                        CustomTextField(label: "Şifre", obscureText: true),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            context.goNamed(AppRoutes.login.name);
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
                                "Kayıt Ol",
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
                          children: [
                            Checkbox(
                              activeColor: Theme.of(
                                context,
                              ).colorScheme.secondary,
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                              value: ref.watch(checkProivder),
                              onChanged: (value) {
                                ref.read(checkProivder.notifier).state = value!;
                              },
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20),
                                            ),
                                          ),
                                          builder: (context) {
                                            return SizedBox(
                                              height:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.height *
                                                  0.75,
                                              child: RegisterShowmodal(),
                                            );
                                          },
                                        );
                                      },

                                      child: Text(
                                        "Gizlilik Politikası ve Kullanıcı sözleşmesini",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: Colors.white,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor: Colors.white,
                                              decorationThickness: 2,
                                            ),
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      "okudum ve",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(color: AppColors.grey),
                                    ),
                                  ],
                                ),
                                Text(
                                  "onaylıyorum.",
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(color: AppColors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Hesabın var mı?",
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: AppColors.grey),
                            ),
                            SizedBox(width: 4),
                            GestureDetector(
                              onTap: () {
                                context.goNamed(AppRoutes.login.name);
                              },
                              child: Text(
                                "Giriş Yap",
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
