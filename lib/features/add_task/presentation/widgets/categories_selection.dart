import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/features/add_task/data/models/task_category_model.dart';
import 'package:todo_app/features/add_task/presentation/widgets/category_selection_body.dart';

class CategoriesSelectionDialog extends StatefulWidget {
  const CategoriesSelectionDialog({super.key, required this.onCategoryTapped});
  final Function(TaskCategoryModel) onCategoryTapped;

  @override
  State<CategoriesSelectionDialog> createState() =>
      _CategoriesSelectionDialogState();
}

class _CategoriesSelectionDialogState extends State<CategoriesSelectionDialog> {
  String selectedCategoryName = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.selectCategory, style: AppStyles.textStyleBold18),
        8.vGap,
        InputDecorator(
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          ),
          child: InkWell(
            onTap: () => showCategoriesDialog(context),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                      selectedCategoryName.isEmpty
                          ? AppStrings.select
                          : selectedCategoryName,
                      style: selectedCategoryName.isEmpty
                          ? AppStyles.greyTextStyle14
                          : AppStyles.textStyle16),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.greyShade500,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<dynamic> showCategoriesDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: AppColors.darkGray,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Container(
            width: 350.w,
            constraints: BoxConstraints(
              maxHeight: 460.h,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 10.h,
            ),
            child: CategorySelectionBody(
              onCategoryTapped: (category) {
                setState(() {
                  selectedCategoryName = category.categoryName;
                });
                widget.onCategoryTapped(category);
              },
            ),
          ),
        );
      },
    );
  }
}
