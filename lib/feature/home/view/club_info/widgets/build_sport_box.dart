import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';

Widget buildSportBox(String svgPath, String label) {
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
        children: [
          SvgPicture.asset(svgPath, width: 20, height: 20),
          SizedBox(width: 5),
          Text(label),
        ],
      ),
    ),
  );
}
