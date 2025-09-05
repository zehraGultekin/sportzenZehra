import 'package:flutter/material.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/core/theme/text_style.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const CustomTextField({
    super.key,
    required this.label,
    this.suffixIcon,
    required this.obscureText,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      cursorColor: AppColors.grey,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff201e2a)),
          borderRadius: BorderRadius.circular(30),
        ),
        filled: true,
        errorStyle: TextStyle(color: Colors.red, fontSize: 12),
        fillColor: Color(0xff201e2a),
        labelText: label,
        labelStyle: AppTextStyles.inputhintstyle.copyWith(
          color: AppColors.grey.withValues(alpha: 0.6),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(30),
        ),
        suffixIcon: Icon(
          suffixIcon,
          color: AppColors.grey.withValues(alpha: 0.6),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff201e2a)),
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff201e2a)),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
