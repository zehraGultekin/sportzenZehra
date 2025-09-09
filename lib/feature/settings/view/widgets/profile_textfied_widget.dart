import 'package:flutter/material.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';

class ProfileTextField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final bool enabled;
  final IconData? preffixIcon;
  final String? initialValue;
  final VoidCallback? onTap;
  const ProfileTextField({
    super.key,
    this.label,
    this.preffixIcon,
    this.initialValue,
    required this.enabled,
    this.onTap,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      controller: controller,
      enabled: enabled,
      readOnly: onTap != null,
      onTap: onTap,
      initialValue: initialValue,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
      ),
      cursorColor: AppColors.grey,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.opacitygrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.opacitygrey),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.opacitygrey),
          borderRadius: BorderRadius.circular(15),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.opacitygrey),
        ),
        filled: true,
        fillColor: AppColors.backgroundGrey,
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: theme.textTheme.labelMedium?.copyWith(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: Icon(preffixIcon, color: AppColors.grey),
      ),
    );
  }
}
