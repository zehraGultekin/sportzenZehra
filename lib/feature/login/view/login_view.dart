import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/router/router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/feature/login/view/widgets/custom_text_field.dart';
import 'package:sportzenzehra/feature/login/view/widgets/login_show_bottom.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Image.asset("assets/images/news.png", height: 200),
                Center(
                  child: Text(
                    "Hoş Geldin",
                    style: theme.textTheme.headlineLarge?.copyWith(
                      color: AppColors.grey,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          label: 'E posta',
                          suffixIcon: Icons.mail_outline_sharp,
                          obscureText: false,
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'E-posta boş bırakılamaz';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
                        CustomTextField(
                          controller: _passwordController,
                          label: "Sifre",
                          suffixIcon: Icons.lock_outline_sharp,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Şifre boş bırakılamaz';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Şifreni mi unuttun? ",
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: AppColors.grey.withValues(
                                        alpha: 0.6,
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Yenile",
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.white,
                                      decorationThickness: 2,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) =>
                                              LoginShowBottom(),
                                        );
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 45),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.goNamed(AppRoutes.home.name);
                            }
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: theme.colorScheme.secondary,
                            ),
                            child: Center(
                              child: Text(
                                "Giriş Yap",
                                style: theme.textTheme.titleLarge?.copyWith(
                                  color: theme.colorScheme.onPrimary,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Column(
                  spacing: 20,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Hesabın yok mu ",
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.grey.withValues(alpha: 0.6),
                        ),
                        children: [
                          TextSpan(
                            text: "Kayıt ol",
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                              decorationThickness: 1,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.goNamed(AppRoutes.register.name);
                              },
                          ),
                        ],
                      ),
                    ),

                    Center(
                      child: Text(
                        "Ya da",
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.grey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: theme.scaffoldBackgroundColor,
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
                                  const SizedBox(width: 5),
                                  Text(
                                    "Google ile giriş",
                                    style: theme.textTheme.labelMedium
                                        ?.copyWith(color: AppColors.black70),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: theme.scaffoldBackgroundColor,
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
                                  const SizedBox(width: 5),
                                  Text(
                                    "Apple ile giriş",
                                    style: theme.textTheme.labelMedium
                                        ?.copyWith(color: AppColors.black70),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
