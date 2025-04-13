import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/core/shared_widgets/show_snackbar_widget.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/utils/app_static_lists.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/features/add_task/data/models/task_category_model.dart';
import 'package:todo_app/features/add_task/presentation/widgets/titled_category_widget.dart';

class CategorySelectionBody extends StatelessWidget {
  const CategorySelectionBody({
    super.key,
    required this.onCategoryTapped,
  });
  final Function(TaskCategoryModel) onCategoryTapped;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        20.vGap,
        Text(
          AppStrings.chooseCategory,
          style: AppStyles.textStyleBold18,
        ),
        5.vGap,
        Divider(
          color: AppColors.dividerColor,
          thickness: 1,
        ),
        20.vGap,
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: AppStaticLists.categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 20.w,
              mainAxisSpacing: 20.h,
              crossAxisCount: 3,
              childAspectRatio: 0.75, // Adjusted aspect ratio
            ),
            itemBuilder: (context, index) {
              return InkWell(
                  borderRadius: BorderRadius.circular(16.r),
                  splashColor: AppColors.grayColor,
                  onTap: () {
                    log('Category tapped: ${AppStaticLists.categories[index].categoryName}');
                    onCategoryTapped(AppStaticLists.categories[index]);
                    showSnackBar(context,
                        "${AppStaticLists.categories[index].categoryName} Selected");
                    Future.delayed(const Duration(milliseconds: 1500), () {
                      Navigator.pop(context);
                    });
                  },
                  child: TitledCategoryWidget(
                      category: AppStaticLists.categories[index]));
            },
          ),
        ),
      ],
    );
  }
}
