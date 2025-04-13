import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/features/add_task/data/models/task_data_model.dart';
import 'package:todo_app/features/my_tasks/presentation/view/task_details_view.dart';
import 'package:todo_app/features/my_tasks/presentation/widgets/edit_and_delete_task.dart';
import 'package:todo_app/features/my_tasks/presentation/widgets/task_card_list_tile.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
    required this.taskModel,
  });

  final TaskDataModel taskModel;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  int isCompleted = 0;

  @override
  void initState() {
    super.initState();
    isCompleted = widget.taskModel.homeTaskDataModel.isCompleted;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      child: Material(
        borderRadius: BorderRadius.circular(16.r),
        color: Color(
          widget.taskModel.homeTaskDataModel.cardColor ??
              AppColors.greyShade900.toARGB32(),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(16.r),
          splashColor: AppColors.primaryBlueClr,
          highlightColor: AppColors.redShade500,
          onTap: () {
            navigateToDetailsViewMethod(context);
          },
          child: Column(
            children: [
              TaskCardListTile(taskModel: widget.taskModel),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Divider(
                  color: AppColors.grayColor,
                  height: 1,
                  thickness: 1,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8.w, bottom: 4.h),
                child: EditAndDeleteTaskWidget(
                  taskData: widget.taskModel,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToDetailsViewMethod(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 350),
        pageBuilder: (context, animation, secondaryAnimation) =>
            TaskDetailsView(
          taskData: widget.taskModel,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      ),
    );
  }
}
