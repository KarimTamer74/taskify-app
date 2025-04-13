import 'package:flutter/material.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/features/add_task/presentation/widgets/custom_time_picker.dart';

class TitledTimePicker extends StatefulWidget {
  const TitledTimePicker(
      {super.key,
      required this.title,
      required this.hintText,
      this.value,
      required this.onChanged,
      required this.controller});
  final String title;
  final String hintText;
  final String? value;
  final Function(String?) onChanged;
  final TextEditingController controller;

  @override
  State<TitledTimePicker> createState() => _TitledTimePickerState();
}

class _TitledTimePickerState extends State<TitledTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppStyles.textStyleBold18,
        ),
        8.vGap,
        CustomTimePickerField(
            value: widget.controller.text, // Use the controller's text directly
            onChanged: (String? newValue) {
              widget.controller.text = newValue!;
              widget.onChanged(newValue);
            },
            controller: widget.controller)
      ],
    );
  }
}
