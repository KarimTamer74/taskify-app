import 'package:flutter/material.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/app_styles.dart';

class NoTasksWidget extends StatelessWidget {
  const NoTasksWidget({
    super.key,  this.title,  this.subTitle,
  });
final String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        50.vGap,
        Image.asset(
          AppImages.tasksChecklistImage,
          scale: 2,
          color: AppColors.greyShade700,
        ),
        Text(
          title??AppStrings.dontHaveTasksYet,
          style: AppStyles.textStyleBold20,
        ),
        10.vGap,
        Text(
         subTitle?? AppStrings.addNewTaskToGetStarted,
          style: AppStyles.greyTextStyle18,
        ),
      ],
    );
  }
}
