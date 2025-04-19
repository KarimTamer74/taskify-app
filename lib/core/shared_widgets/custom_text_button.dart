import 'package:flutter/material.dart';
import 'package:todo_app/core/extensions/app_theme_ext.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    this.onPressed,
  });
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: AppStyles.textStyle20.copyWith(
          color: context.isDarkMode ? AppColors.white : AppColors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
