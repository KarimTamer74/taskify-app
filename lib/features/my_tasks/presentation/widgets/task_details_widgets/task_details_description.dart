import 'package:flutter/material.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/features/add_task/data/models/task_data_model.dart';

class TaskDetailsDescriptionSection extends StatelessWidget {
  const TaskDetailsDescriptionSection({
    super.key,
    required this.taskData,
  });

  final TaskDataModel taskData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description:",
          style: AppStyles.textStyleBold24,
        ),
        8.vGap,
        Text(
          taskData.description,
          style: AppStyles.textStyle18,
        ),
      ],
    );
  }
}
