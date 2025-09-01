import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/feature/navigator/views/widget/navigator_widget.dart';

class BottomNavigator extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const BottomNavigator({super.key, required this.navigationShell});

  void onTabItem(int index) {
    navigationShell.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        height: 60,
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SideNavItem(
              icon: Icons.home,
              label: "Ana Sayfa",
              isSelected: navigationShell.currentIndex == 0,
              onTap: () => onTabItem(0),
            ),
            SideNavItem(
              icon: Icons.calendar_today_outlined,
              label: "Rezervasyon",
              isSelected: navigationShell.currentIndex == 1,
              onTap: () => onTabItem(1),
            ),
            SideNavItem(
              icon: Icons.notifications_none_rounded,
              label: "Bildirimler",
              isSelected: navigationShell.currentIndex == 2,
              onTap: () => onTabItem(2),
            ),
            SideNavItem(
              icon: Icons.sms_outlined,
              label: "Mesajlar",
              isSelected: navigationShell.currentIndex == 3,
              onTap: () => onTabItem(3),
            ),
            SideNavItem(
              icon: Icons.settings,
              label: "Seçenekler",
              isSelected: navigationShell.currentIndex == 4,
              onTap: () => onTabItem(4),
            ),
          ],
        ),
      ),
    );
  }
}
