import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownField extends StatelessWidget {
  const CustomDropdownField({
    super.key,
    required this.hintText,
    required this.items,
    required this.onChanged,
    required this.controller,
    this.value,
  });

  final String hintText;
  final String? value;
  final List<String> items;
  final Function(String?) onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),

        hintText: controller.text.isEmpty
            ? hintText
            : null, // Only show hintText if controller.text is empty
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: controller.text.isEmpty
            ? items[0]
            : controller.text, // Display hintText or selected value
        icon: const Icon(Icons.keyboard_arrow_down),
        underline: SizedBox(), // Hide the default underline
        items: items.map((String reminder) {
          return DropdownMenuItem<String>(
            value: reminder,
            child: Text(reminder),
          );
        }).toList(),
        onChanged: (String? newValue) {
          // Ensure state is updated and UI reflects the new value
          controller.text = newValue!;
          onChanged(newValue);
        },
      ),
    );
  }
}
