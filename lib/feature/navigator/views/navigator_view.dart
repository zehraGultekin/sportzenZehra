import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/feature/navigator/views/widget/navigator_widget.dart';

class BottomNavigator extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const BottomNavigator({super.key, required this.navigationShell});

  void onTabItem(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: navigationShell.currentIndex == index,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        height: 50,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Row(
          spacing: 9,
          mainAxisSize: MainAxisSize.min,
          children: [
            NavItem(
              label: "Ana Sayfa",
              isSelected: navigationShell.currentIndex == 0,
              onTap: () => onTabItem(0),
              unselectedIcon: Icons.home_outlined,
              selectedIcon: Icons.home_rounded,
            ),
            NavItem(
              label: "Rezervasyon",
              isSelected: navigationShell.currentIndex == 1,
              onTap: () => onTabItem(1),
              unselectedIcon: Icons.calendar_month_outlined,
              selectedIcon: Icons.calendar_month_rounded,
            ),
            NavItem(
              label: "Bildirimler",
              isSelected: navigationShell.currentIndex == 2,
              onTap: () => onTabItem(2),
              unselectedIcon: Icons.notification_add_outlined,
              selectedIcon: Icons.notifications_active_rounded,
            ),
            NavItem(
              label: "Mesajlar",
              isSelected: navigationShell.currentIndex == 3,
              onTap: () => onTabItem(3),
              unselectedIcon: Icons.sms_outlined,
              selectedIcon: Icons.sms_rounded,
            ),
            NavItem(
              label: "Seçenekler",
              isSelected: navigationShell.currentIndex == 4,
              onTap: () => onTabItem(4),
              unselectedIcon: Icons.settings_outlined,
              selectedIcon: Icons.settings_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
