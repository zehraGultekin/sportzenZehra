import 'package:flutter/gestures.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _mailController = TextEditingController();
  final _passwordControler = TextEditingController();
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        spacing: 15,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  label: "Ad",
                                  obscureText: false,
                                  controller: _nameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Ad boş olamaz';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: CustomTextField(
                                  label: "Soyad",
                                  obscureText: false,
                                  controller: _surnameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Soyad boş olamaz';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),

                          CustomTextField(
                            label: "Kullanıcı Adı",
                            obscureText: false,
                          ),

                          CustomTextField(
                            label: "E-Mail",
                            obscureText: false,
                            controller: _mailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'E-mail alanı boş bırakılamaz';
                              }
                              return null;
                            },
                          ),

                          CustomTextField(label: "Telefon", obscureText: false),

                          CustomTextField(
                            label: "Şifre",
                            obscureText: true,
                            controller: _passwordControler,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Şifre alanı boş bırakılamaz';
                              }
                              return null;
                            },
                          ),

                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                context.goNamed(AppRoutes.login.name);
                              }
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
                                  "Kayıt Ol",
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    color: theme.colorScheme.onPrimary,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 18,
                                  width: 18,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: AppColors.grey),
                                  ),
                                  child: Checkbox(
                                    activeColor: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                    side: BorderSide(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onPrimary,
                                    ),
                                    value: ref.watch(checkProivder),
                                    onChanged: (value) {
                                      ref.read(checkProivder.notifier).state =
                                          value!;
                                    },
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              "Gizlilik Politikası ve Kullanıcı Sözleşmesini ",
                                          style: TextStyle(
                                            color: Colors.white,
                                            decoration:
                                                TextDecoration.underline,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                        top: Radius.circular(
                                                          20,
                                                        ),
                                                      ),
                                                ),
                                                builder: (context) {
                                                  return SizedBox(
                                                    height:
                                                        MediaQuery.of(
                                                          context,
                                                        ).size.height *
                                                        0.80,
                                                    child: RegisterShowmodal(),
                                                  );
                                                },
                                              );
                                            },
                                        ),
                                        TextSpan(
                                          text: "okudum ve onaylıyorum",
                                          style: TextStyle(
                                            color: AppColors.grey,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: "Hesabın var mı? ",
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: AppColors.grey,
                              ),
                              children: [
                                TextSpan(
                                  text: "Giriş Yap",
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.onPrimary,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.white,
                                    decorationThickness: 2,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.goNamed(AppRoutes.login.name);
                                    },
                                ),
                              ],
                            ),
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
    );
  }
}
