import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      // margin: const EdgeInsets.all(32),
      backgroundColor: AppColors.sportsColor,
      duration: const Duration(milliseconds: 1300),
      content: Center(
        child: Text(
          message,
          style: AppStyles.textStyleBold20.copyWith(color: AppColors.black),
        ),
      ),
    ),
  );
}
