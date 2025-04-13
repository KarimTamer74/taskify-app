import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/features/add_task/data/models/task_category_model.dart';

class TitledCategoryWidget extends StatelessWidget {
  const TitledCategoryWidget({
    super.key,
    required this.category,
  });

  final TaskCategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 65.w,
          height: 65.h,
          decoration: BoxDecoration(
            color: Color(category.categoryColor),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Center(
            child: SvgPicture.asset(
              category.iconPath,
              width: 30.w,
              height: 30.h,
            ),
          ),
        ),
        8.vGap,
        SizedBox(
          width: 70.w, // Constrained width
          child: Text(
            category.categoryName,
            style: AppStyles.textStyle14,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
