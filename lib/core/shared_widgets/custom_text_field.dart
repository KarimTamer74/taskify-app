import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.suffixWidget,
    this.onSuffixIconPressed,
    required this.controller,
    this.validator,
    this.keyboardType,
    this.maxLines,
  });
  final String hintText;
  final Widget? suffixWidget;
  final void Function()? onSuffixIconPressed;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines ?? 1,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixWidget,
        hintStyle: AppStyles.greyTextStyle14,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: AppColors.bluishClr, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: AppColors.greyShade800, width: 2),
        ),
      ),
    );
  }
}
