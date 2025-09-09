import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/router/router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/core/widgets/appbar.dart';
import 'package:sportzenzehra/feature/settings/view/widgets/setting_menu_item.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(title: "Ayarlar"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.backgroundGrey,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.grey.withValues(alpha: 0.1),
                ),
              ),
              child: Column(
                children: [
                  SettingsMenuItem(
                    colors: Colors.black,
                    icon: Icons.person_2_outlined,
                    title: 'Profil',
                    onTap: () {
                      context.pushNamed(AppRoutes.profile.name);
                    },
                  ),
                  SettingsMenuItem(
                    colors: Colors.black,
                    icon: Icons.credit_card,
                    title: 'Finans İşlemleri',
                    onTap: () {
                      context.pushNamed(AppRoutes.finance.name);
                    },
                  ),
                  SettingsMenuItem(
                    colors: Colors.black,
                    icon: Icons.manage_accounts_rounded,
                    title: 'Hesap İşlemleri',
                    onTap: () {
                      context.pushNamed(AppRoutes.account.name);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: AppColors.backgroundGrey,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.grey.withValues(alpha: 0.1),
                ),
              ),
              child: Column(
                children: [
                  SettingsMenuItem(
                    colors: Colors.black,
                    icon: Icons.headset_mic,
                    title: 'Yardım Merkezi',
                    onTap: () {
                      context.pushNamed(AppRoutes.helpCenter.name);
                    },
                  ),
                  SettingsMenuItem(
                    colors: Colors.black,
                    icon: Icons.info_outline,
                    title: 'Uygulama hakkında',
                    onTap: () {
                      context.pushNamed(AppRoutes.about.name);
                    },
                  ),
                  SettingsMenuItem(
                    colors: Colors.black,
                    icon: Icons.policy_outlined,
                    title: 'KVKK, Hizmet Şartları ve Gizlilik\nPolitikası',
                    onTap: () {
                      context.pushNamed(AppRoutes.kvkk.name);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: AppColors.backgroundGrey,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.grey.withValues(alpha: 0.1),
                ),
              ),
              child: Column(
                children: [
                  SettingsMenuItem(
                    colors: const Color.fromARGB(255, 170, 16, 5),
                    icon: Icons.exit_to_app,
                    title: 'Çıkış Yap',

                    onTap: () {
                      context.goNamed(AppRoutes.login.name);
                    },
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: theme.scaffoldBackgroundColor,
                  backgroundImage: AssetImage("assets/images/logo.png"),
                  radius: 15,
                ),
                SizedBox(width: 10),
                Text(
                  "Sürüm: 1.2.0",
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    SizedBox(width: 10),
                    Text(
                      "Değerlendir",
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.amber,
                        fontWeight: FontWeight.w500,
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
