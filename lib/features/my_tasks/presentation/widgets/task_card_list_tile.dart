import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/features/add_task/data/models/task_data_model.dart';
import 'package:todo_app/features/my_tasks/presentation/cubit/my_tasks_cubit.dart';

class TaskCardListTile extends StatefulWidget {
  const TaskCardListTile({super.key, required this.taskModel});
final TaskDataModel taskModel;

  @override
  State<TaskCardListTile> createState() => _TaskCardListTileState();
}

class _TaskCardListTileState extends State<TaskCardListTile> {
  
  int isCompleted = 0;
  @override
  Widget build(BuildContext context) {
    return    ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                leading: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    isCompleted == 1
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    size: 26.sp,
                  ),
                  color: isCompleted == 1 ? Colors.green : Colors.white,
                  onPressed: () {
                    checkIsTaskCompletedMethod(context);
                  },
                ),
                title: Text(
                  widget.taskModel.homeTaskDataModel.title,
                  style: AppStyles.textStyleBold18.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                subtitle: Text(
                  widget.taskModel.homeTaskDataModel.time,
                  style: AppStyles.textStyle15.copyWith(
                    color: AppColors.greyShade300,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                trailing: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: Color(widget.taskModel.homeTaskDataModel
                        .categoryDetails.categoryColor),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        widget.taskModel.homeTaskDataModel.categoryDetails
                            .iconPath,
                        height: 20.h,
                        width: 20.w,
                      ),
                      5.hGap,
                      Text(
                        widget.taskModel.homeTaskDataModel.categoryDetails
                            .categoryName,
                        style: AppStyles.textStyle14.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              )
           ;
  }

  void checkIsTaskCompletedMethod(BuildContext context) {
      setState(() {
      isCompleted = isCompleted == 0 ? 1 : 0;
    });
    BlocProvider.of<MyTasksCubit>(context).updateTask(
      id: widget.taskModel.homeTaskDataModel.id!,
      value: isCompleted,
    );
  }
}