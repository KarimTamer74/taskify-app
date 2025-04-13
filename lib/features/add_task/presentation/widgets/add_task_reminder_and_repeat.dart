import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_static_lists.dart';
import 'package:todo_app/features/add_task/domain/entities/task_field.dart';
import 'package:todo_app/features/add_task/presentation/widgets/titled_drop_down_field.dart';

class AddTaskFieldsBottom extends StatefulWidget {
  const AddTaskFieldsBottom({
    super.key,
    required this.controllers,
  });

  final Map<TaskField, TextEditingController> controllers;

  @override
  _AddTaskFieldsBottomState createState() => _AddTaskFieldsBottomState();
}

class _AddTaskFieldsBottomState extends State<AddTaskFieldsBottom> {


  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        TitledDropDownField(
          title: "Reminder",
          hintText: 'Select Task Reminder',
          items: AppStaticLists.reminderOptions,
          onChanged: (String? newValue) {
            setState(() {
              widget.controllers[TaskField.reminder]!.text = newValue!;
              // Update the value in state
            });
          },
          controller: widget.controllers[TaskField.reminder]!,
          value: widget.controllers[TaskField.reminder]!.text,
        ),
        TitledDropDownField(
          title: "Repeat",
          hintText: 'Select Task Repeat',
          items: AppStaticLists.repeatOptions,
          onChanged: (String? newValue) {
            setState(() {
              widget.controllers[TaskField.repeat]!.text = newValue!;
              // Update the value in state
            });
          },
          controller: widget.controllers[TaskField.repeat]!,
          value: widget.controllers[TaskField.repeat]!.text,
        ),
      ],
    );
  }
}
