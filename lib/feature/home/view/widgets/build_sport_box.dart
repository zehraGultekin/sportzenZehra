import 'package:flutter/material.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';

Widget buildSportBox(IconData icon, String label) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: AppColors.backgroundGrey,
      border: Border.all(color: AppColors.opacitygrey),
    ),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(icon, size: 18), SizedBox(width: 5), Text(label)],
      ),
    ),
  );
}
