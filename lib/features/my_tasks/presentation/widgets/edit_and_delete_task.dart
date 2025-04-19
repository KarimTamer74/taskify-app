import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/routing/routes.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/features/add_task/data/models/task_data_model.dart';
import 'package:todo_app/features/my_tasks/presentation/cubit/my_tasks_cubit.dart';

class EditAndDeleteTaskWidget extends StatelessWidget {
  const EditAndDeleteTaskWidget({
    super.key,
    required this.taskData,
  });
  final TaskDataModel taskData;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () async {
            // Navigate to the edit task screen
            final result = await Navigator.of(context)
                .pushNamed(Routes.editTaskView, arguments: taskData);
            if (result == true) {
              BlocProvider.of<MyTasksCubit>(context).getTasksByDate();
            }
          },
          icon: Icon(
            Icons.edit,
          ),
          tooltip: 'Edit Task',
          iconSize: 22.sp,
        ),
        IconButton(
          onPressed: () {
            BlocProvider.of<MyTasksCubit>(context)
                .deleteTask(taskData.homeTaskDataModel.id!);
          },
          icon: Icon(Icons.delete, color: AppColors.redShade400),
          tooltip: 'Delete Task',
          iconSize: 22.sp,
        ),
      ],
    );
  }
}
