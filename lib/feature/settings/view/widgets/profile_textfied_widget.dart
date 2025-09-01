import 'package:flutter/material.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/core/theme/text_style.dart';

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
    return TextFormField(
      controller: controller,
      enabled: enabled,
      readOnly: onTap != null,
      onTap: onTap,
      initialValue: initialValue,
      style: Theme.of(context).textTheme.bodyLarge,
      cursorColor: AppColors.grey,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.grey.withValues(alpha: 0.1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey.withValues(alpha: 0.1)),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey.withValues(alpha: 0.1)),
          borderRadius: BorderRadius.circular(10),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.grey.withValues(alpha: 0.2)),
        ),
        filled: true,
        fillColor: AppColors.grey.withValues(alpha: 0.1),
        labelText: label,
        labelStyle: AppTextStyles.inputhintstyle.copyWith(
          color: AppColors.grey,
        ),
        prefixIcon: Icon(preffixIcon, color: AppColors.grey),
      ),
    );
  }
}
