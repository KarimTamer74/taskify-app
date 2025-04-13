import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/features/add_task/data/models/task_data_model.dart';
import 'package:todo_app/features/my_tasks/presentation/cubit/my_tasks_cubit.dart';
import 'package:todo_app/features/my_tasks/presentation/widgets/edit_and_delete_task.dart';
import 'package:todo_app/features/my_tasks/presentation/widgets/task_details_widgets/task_details_category.dart';
import 'package:todo_app/features/my_tasks/presentation/widgets/task_details_widgets/task_details_date_time.dart';
import 'package:todo_app/features/my_tasks/presentation/widgets/task_details_widgets/task_details_description.dart';
import 'package:todo_app/features/my_tasks/presentation/widgets/task_details_widgets/task_details_reminder_repeate.dart';

class TaskDetailsViewBody extends StatelessWidget {
  const TaskDetailsViewBody({super.key, required this.taskData});
  final TaskDataModel taskData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.vGap,
          // Title
          Text(
            taskData.homeTaskDataModel.title,
            style: AppStyles.textStyleBold24,
          ),
          12.vGap,
          // Date & Time
          TaskDetailsDateTimeSection(taskData: taskData),
          20.vGap,
          // Reminder & Repeat
          TaskDetailsReminderRepeatSection(
            taskData: taskData,
          ),
          20.vGap,
          // Description
          TaskDetailsDescriptionSection(taskData: taskData),
          20.vGap,
          // Category
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TaskDetailsCategorySection(taskData: taskData),
              BlocProvider(
                create: (context) => MyTasksCubit(),
                child: EditAndDeleteTaskWidget(taskData: taskData),
              )
            ],
          ),
        ],
      ),
    );
  }
}
