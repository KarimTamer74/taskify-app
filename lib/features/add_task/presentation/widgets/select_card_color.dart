import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/app_styles.dart';

class AddTaskSelectColorSection extends StatefulWidget {
  const AddTaskSelectColorSection({
    super.key,
    this.onColorSelected,
  });

  final Function(Color color)? onColorSelected;

  @override
  State<AddTaskSelectColorSection> createState() =>
      _AddTaskSelectColorSectionState();
}

class _AddTaskSelectColorSectionState extends State<AddTaskSelectColorSection> {
  final List<Color> taskSelectColors = [
    AppColors.darkVeryGray,
    AppColors.darkBlue,
    AppColors.darkPink,
    AppColors.tealGreen,
    AppColors.darkPurple,
    AppColors.royalBlue,
    AppColors.deepOrange,
    AppColors.darkGreen,
    AppColors.charcoalGray,
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.color,
            style: AppStyles.textStyleBold20,
          ),
          10.vGap,
          SizedBox(
            height: 35.h,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: taskSelectColors.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        widget.onColorSelected?.call(taskSelectColors[index]);
                        log("Selected card color: ${taskSelectColors[index]}");
                      });
                    },
                    child: Container(
                      width: 35.w,
                      height: 35.w,
                      margin: EdgeInsets.only(right: 8.w),
                      decoration: BoxDecoration(
                        color: taskSelectColors[index],
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                    ),
                  );
                }),
          ),
        ]);
  }
}
