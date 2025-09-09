import 'package:flutter/material.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';

class PasswordField extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscureText;
  final FormFieldValidator<String>? validator;

  const PasswordField({
    super.key,
    required this.label,
    required this.hint,
    this.obscureText = true,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14)),
        const SizedBox(height: 5),
        TextFormField(
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
            fillColor: AppColors.backgroundGrey,
            filled: true,
            hintText: hint,
            hintStyle: theme.textTheme.bodyLarge?.copyWith(
              fontSize: 14,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.colorScheme.error),
              borderRadius: BorderRadius.circular(15),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.colorScheme.error),
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.opacitygrey),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.opacitygrey),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
