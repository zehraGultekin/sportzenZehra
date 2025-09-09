import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // eşit dağıt
          children: [
            NavItem(
              label: "Ana Sayfa",
              isSelected: navigationShell.currentIndex == 0,
              onTap: () => onTabItem(0),
              unselectedIcon: Icon(
                Icons.home_outlined,
                size: 26,
                color: Colors.grey.shade700,
              ),
              selectedIcon: Icon(
                Icons.home_rounded,
                size: 26,
                color: Colors.white,
              ),
            ),
            NavItem(
              label: "Rezervasyon",
              isSelected: navigationShell.currentIndex == 1,
              onTap: () => onTabItem(1),
              unselectedIcon: SvgPicture.asset(
                "assets/icons/calendar.svg",
                width: 22,
                height: 22,
                color: Colors.grey.shade700,
              ),
              selectedIcon: SvgPicture.asset(
                "assets/icons/calendar_outlined.svg",
                width: 26,
                height: 26,
                color: Colors.white,
              ),
            ),
            NavItem(
              label: "Bildirimler",
              isSelected: navigationShell.currentIndex == 2,
              onTap: () => onTabItem(2),
              unselectedIcon: Icon(
                Icons.notifications_none_outlined,
                size: 26,
                color: Colors.grey.shade700,
              ),
              selectedIcon: Icon(
                Icons.notifications_sharp,
                size: 26,
                color: Colors.white,
              ),
            ),
            NavItem(
              label: "Mesajlar",
              isSelected: navigationShell.currentIndex == 3,
              onTap: () => onTabItem(3),
              unselectedIcon: Icon(
                Icons.sms_outlined,
                color: Colors.grey.shade700,
                size: 26,
              ),
              selectedIcon: Icon(
                Icons.sms_rounded,
                color: Colors.white,
                size: 26,
              ),
            ),
            NavItem(
              label: "Seçenekler",
              isSelected: navigationShell.currentIndex == 4,
              onTap: () => onTabItem(4),
              unselectedIcon: Icon(
                Icons.settings_outlined,
                color: Colors.grey.shade700,
                size: 26,
              ),
              selectedIcon: Icon(
                Icons.settings_rounded,
                color: Colors.white,
                size: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
