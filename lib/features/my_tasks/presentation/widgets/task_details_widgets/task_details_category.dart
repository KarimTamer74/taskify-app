import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/features/add_task/data/models/task_data_model.dart';

class TaskDetailsCategorySection extends StatelessWidget {
  const TaskDetailsCategorySection({
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
          "Category:",
          style: AppStyles.textStyleBold24,
        ),
        8.vGap,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 60.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: Color(
                    taskData.homeTaskDataModel.categoryDetails.categoryColor),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: SvgPicture.asset(
                    taskData.homeTaskDataModel.categoryDetails.iconPath,
                    width: 24.w),
              ),
            ),
            12.hGap,
            Text(
              taskData.homeTaskDataModel.categoryDetails.categoryName,
              style: AppStyles.textStyle18,
            ),
          ],
        ),
      ],
    );
  }
}
