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
    return Scaffold(
      appBar: CustomAppBar(title: "Ayarlar"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.grey.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.grey.withValues(alpha: 0.2),
                ),
              ),
              child: Column(
                children: [
                  SettingsMenuItem(
                    icon: Icons.person_2_outlined,
                    title: 'Profil',
                    onTap: () {
                      context.pushNamed(AppRoutes.profile.name);
                    },
                  ),
                  SettingsMenuItem(
                    icon: Icons.wallet_outlined,
                    title: 'Finans İşlemleri',
                    onTap: () {},
                  ),
                  SettingsMenuItem(
                    icon: Icons.settings,
                    title: 'Hesap İşlemleri',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: AppColors.grey.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.grey.withValues(alpha: 0.2),
                ),
              ),
              child: Column(
                children: [
                  SettingsMenuItem(
                    icon: Icons.headset_mic,
                    title: 'Yardım Merkezi',
                    onTap: () {},
                  ),
                  SettingsMenuItem(
                    icon: Icons.info_outline,
                    title: 'Uygulama hakkında',
                    onTap: () {},
                  ),
                  SettingsMenuItem(
                    icon: Icons.policy_outlined,
                    title: 'KVKK, Hizmet Şartları ve Gizlilik Politikası',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: AppColors.grey.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.grey.withValues(alpha: 0.2),
                ),
              ),
              child: Column(
                children: [
                  SettingsMenuItem(
                    colors: Colors.red,
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
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/images/logo.png"),
                      radius: 15,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Sürüm: 1.2.0",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    SizedBox(width: 10),
                    Text(
                      "Değerlendir",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: Colors.amber),
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
