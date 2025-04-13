import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/features/add_task/data/models/task_data_model.dart';

class TaskDetailsDateTimeSection extends StatelessWidget {
  const TaskDetailsDateTimeSection({
    super.key,
    required this.taskData,
  });

  final TaskDataModel taskData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.calendar_today, size: 20.sp),
            8.hGap,
            Text(
              taskData.homeTaskDataModel.date,
              style: AppStyles.textStyle15,
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.access_time, size: 20.sp),
            8.hGap,
            Text('${taskData.startTime} - ${taskData.endTime}',
                style: AppStyles.textStyle15),
          ],
        ),
      ],
    );
  }
}
