import 'package:flutter/material.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/features/add_task/presentation/widgets/custom_drop_down_field.dart';

class TitledDropDownField extends StatefulWidget {
  const TitledDropDownField(
      {super.key,
      required this.hintText,
      required this.title,
      this.value,
      required this.items,
      required this.onChanged,
      required this.controller});
  final String hintText, title;
  final String? value;
  final List<String> items;
  final Function(String?) onChanged;
  final TextEditingController controller;

  @override
  State<TitledDropDownField> createState() => _TitledDropDownFieldState();
}

class _TitledDropDownFieldState extends State<TitledDropDownField> {
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
        CustomDropdownField(
            hintText: widget.hintText,
            items: widget.items,
            onChanged: (String? newValue) {
              widget.controller.text = newValue!;
              widget.onChanged(newValue);
            },
            controller: widget.controller)
      ],
    );
  }
}
