import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/add_task/data/models/add_task_model.dart';
import 'package:todo_app/features/add_task/domain/entities/task_field.dart';
import 'package:todo_app/features/add_task/presentation/widgets/accept_task_data.dart';

class AddTaskFieldsTop extends StatelessWidget {
  const AddTaskFieldsTop({super.key, required this.controllers});

  final Map<TaskField, TextEditingController> controllers;

  static final List<AddTaskItem> _taskFieldsTop = [
    AddTaskItem(
      hint: 'Enter Task Title',
      title: 'Title',
      controllerKey: TaskField.title,
    ),
    AddTaskItem(
      hint: 'Enter Task Description',
      title: 'Description',
      controllerKey: TaskField.description,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ..._taskFieldsTop.map(
          (item) => Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: AcceptTaskData(
              hintText: item.hint,
              textFieldTitle: item.title,
              suffixWidget: item.icon,
              keyboardType: item.title == 'Description'
                  ? TextInputType.multiline
                  : TextInputType.text,
              maxLines: item.title == 'Description' ? null : 1,
              onSuffixIconPressed: item.onPressed,
              controller: controllers[item.controllerKey]!,

              // Add validator only to fields that need validation
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '${item.title} is required';
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }
}
