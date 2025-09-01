import 'package:flutter/material.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/core/theme/text_style.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData? suffixIcon;
  final bool obscureText;
  const CustomTextField({
    super.key,
    required this.label,
    this.suffixIcon,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      cursorColor: AppColors.grey,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff201e2a)),
          borderRadius: BorderRadius.circular(30),
        ),
        filled: true,

        fillColor: Color(0xff201e2a),
        labelText: label,
        labelStyle: AppTextStyles.inputhintstyle.copyWith(
          color: AppColors.grey,
        ),
        suffixIcon: Icon(suffixIcon, color: AppColors.grey),
      ),
    );
  }
}
