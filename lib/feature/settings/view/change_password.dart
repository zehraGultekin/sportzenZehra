import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/widgets/appbar.dart';
import 'package:sportzenzehra/core/widgets/custom_snack_bar.dart';
import 'package:sportzenzehra/feature/settings/view/widgets/password_field.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final _formKey = GlobalKey<FormState>();
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
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PasswordField(
                label: "Yeni Şifre",
                hint: "Yeni Şifrenizi Girin",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Yeni şifrenizi girin';
                  }
                  return null;
                },
              ),

              PasswordField(
                label: "Yeni Şifre (Tekrar)",
                hint: "Yeni Şifrenizi tekrar girin",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Yeni şifrenizi tekrar girin';
                  }
                  return null;
                },
              ),

              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    String message = "Şifreniz başarıyla değiştirildi";
                    context.pop();

                    final snackBar = SnackBar(
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),

                      content: CustomSnackBar(
                        message: message,
                        iconColor: theme.colorScheme.secondary,
                        borderColor: theme.colorScheme.secondary,
                      ),
                      duration: Duration(seconds: 5),
                    );

                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    return;
                  }
                },
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
      ),
    );
  }
}
