import 'package:flutter/material.dart';
import 'package:todo_app/features/add_task/domain/entities/task_field.dart';

class AddTaskItem {
  final String hint;
  final String title;
  final TaskField controllerKey;
  final Widget? icon;
  final VoidCallback? onPressed;

  AddTaskItem({
    required this.hint,
    required this.title,
    required this.controllerKey,
    this.icon,
    this.onPressed,
  });
}
