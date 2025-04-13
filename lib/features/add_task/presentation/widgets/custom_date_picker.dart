import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/app_styles.dart';

// Function to handle date selection
Future<void> selectDate(BuildContext context, TextEditingController controller,
    Function(String?) onChanged) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
  );

  if (pickedDate != null) {
    final formattedDate = "${pickedDate.toLocal()}".split(' ')[0];
    controller.text = formattedDate;
    onChanged(formattedDate);
  }
}

class CustomDatePickerField extends StatelessWidget {
  const CustomDatePickerField({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.controller,
  });

  final String hintText;
  final Function(String?) onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectDate(context, controller, onChanged);
      },
      child: InputDecorator(
        decoration: InputDecoration(
          hintText: controller.text.isEmpty ? AppStrings.select : null,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                controller.text.isEmpty ? AppStrings.select : controller.text,
                style: controller.text.isEmpty
                    ? AppStyles.greyTextStyle14
                    : AppStyles.textStyle15,
              ),
            ),
            Icon(Icons.calendar_today, color: AppColors.greyShade500),
          ],
        ),
      ),
    );
  }
}
