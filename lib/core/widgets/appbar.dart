import 'package:flutter/material.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;

  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.bottom,
    this.toolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight((toolbarHeight ?? kToolbarHeight));
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).appBarTheme.foregroundColor,
          fontSize: 19,
          fontWeight: FontWeight.w500,
        ),
      ),
      bottom: bottom,
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
