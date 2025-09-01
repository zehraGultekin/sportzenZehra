import 'package:flutter/material.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;

  const CustomAppBar({super.key, required this.title, this.leading});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).appBarTheme.foregroundColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: leading,
      elevation: 0,
      shape: Border(
        bottom: BorderSide(
          color: AppColors.grey.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
    );
  }
}
