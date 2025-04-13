import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/app_styles.dart';

class CustomTimePickerField extends StatelessWidget {
  const CustomTimePickerField({
    super.key,
    required this.onChanged,
    required this.controller,
    this.value,
  });

  final String? value;
  final Function(String?) onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        // Open the time picker
        final TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );

        if (pickedTime != null) {
          final formattedTime =
              pickedTime.format(context); // Format to 12-hour time
          controller.text = formattedTime;
          onChanged(formattedTime); // Update the state
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(),
        child: Row(
          children: [
            Expanded(
              child: Text(
                controller.text.isEmpty
                    ? AppStrings.select
                    : controller.text, // Show controller.text or hintText
                style: controller.text.isEmpty
                    ? AppStyles.greyTextStyle14
                    : AppStyles.textStyle15,
              ),
            ),
            Icon(Icons.access_time, color: AppColors.greyShade500),
          ],
        ),
      ),
    );
  }
}
