import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';

class DateSelectionItem extends StatelessWidget {
  const DateSelectionItem({
    super.key,
    required this.isSelected,
    required this.month,
    required this.dayNumber,
    required this.day,
  });

  final bool isSelected;
  final String month;
  final String dayNumber;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75.w,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryBlueClr : AppColors.greyShade900,
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            month,
            style: AppStyles.textStyle16,
          ),
          // 4.vGap,
          Text(
            dayNumber,
            style: AppStyles.textStyleBold20,
          ),
          Text(
            day,
            style: AppStyles.textStyleBold12,
          ),
        ],
      ),
    );
  }
}
