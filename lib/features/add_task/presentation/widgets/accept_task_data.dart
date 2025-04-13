import 'package:flutter/material.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/core/shared_widgets/custom_text_field.dart';
import 'package:todo_app/core/utils/app_styles.dart';

class AcceptTaskData extends StatelessWidget {
  const AcceptTaskData({
    super.key,
    required this.hintText,
    required this.textFieldTitle,
    this.suffixWidget,
    this.onSuffixIconPressed,
    required this.controller,
    this.validator, this.keyboardType, this.maxLines,
  });
  final String hintText, textFieldTitle;
  final Widget? suffixWidget;
  final void Function()? onSuffixIconPressed;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          textFieldTitle,
          style: AppStyles.textStyleBold18,
        ),
        8.vGap,
        CustomTextFormField(
          hintText: hintText,
          suffixWidget: suffixWidget,
          onSuffixIconPressed: onSuffixIconPressed,
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          maxLines: maxLines,
        )
      ],
    );
  }
}
