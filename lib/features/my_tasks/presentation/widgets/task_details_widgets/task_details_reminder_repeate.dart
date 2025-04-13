import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/features/add_task/data/models/task_data_model.dart';

class TaskDetailsReminderRepeatSection extends StatelessWidget {
  const TaskDetailsReminderRepeatSection({
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
        Row(
          children: [
            Icon(Icons.alarm, size: 20.sp),
            8.hGap,
            Text(
              'Reminder: ${taskData.reminder}',
              style: AppStyles.textStyle16,
            ),
          ],
        ),
        8.vGap,
        Row(
          children: [
            Icon(Icons.repeat, size: 20.sp),
            8.hGap,
            Text(
              'Repeat: ${taskData.repeat}',
              style: AppStyles.textStyle16,
            ),
          ],
        ),
      ],
    );
  }
}
