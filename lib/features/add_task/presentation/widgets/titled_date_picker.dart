import 'package:flutter/material.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/features/add_task/presentation/widgets/custom_date_picker.dart';

class TitledDatePicker extends StatelessWidget {
  final String title;
  final String hintText;
  final Function(String?) onChanged;
  final TextEditingController controller;

  const TitledDatePicker({
    super.key,
    required this.title,
    required this.hintText,
    required this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.textStyleBold18,
        ),
        8.vGap,
        CustomDatePickerField(
          hintText: hintText,
          onChanged: onChanged,
          controller: controller,
        ),
      ],
    );
  }
}
