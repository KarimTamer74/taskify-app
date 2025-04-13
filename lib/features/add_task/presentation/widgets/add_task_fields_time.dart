import 'package:flutter/material.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/features/add_task/domain/entities/task_field.dart';
import 'package:todo_app/features/add_task/presentation/widgets/titled_date_picker.dart';
import 'package:todo_app/features/add_task/presentation/widgets/titled_time_picker.dart';

class AddTaskFieldsTime extends StatefulWidget {
  const AddTaskFieldsTime({super.key, required this.controllers});

  final Map<TaskField, TextEditingController> controllers;

  @override
  State<AddTaskFieldsTime> createState() => _AddTaskFieldsTimeState();
}

class _AddTaskFieldsTimeState extends State<AddTaskFieldsTime> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitledDatePicker(
          title: "Date",
          hintText: "Select",
          onChanged: (String? newValue) {
            setState(() {
              widget.controllers[TaskField.date]!.text = newValue!;
            });
          },
          controller: widget.controllers[TaskField.date]!,
        ),
        10.vGap,
        Row(
          children: [
            Expanded(
              child: TitledTimePicker(
                title: 'Start Time',
                hintText: 'Select',
                onChanged: (String? newValue) {
                  setState(() {
                    widget.controllers[TaskField.startTime]!.text = newValue!;
                  });
                },
                controller: widget.controllers[TaskField.startTime]!,
              ),
            ),
            10.hGap,
            Expanded(
              child: TitledTimePicker(
                title: 'End Time',
                hintText: 'Select',
                onChanged: (String? newValue) {
                  setState(() {
                    widget.controllers[TaskField.endTime]!.text = newValue!;
                  });
                },
                controller: widget.controllers[TaskField.endTime]!,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
