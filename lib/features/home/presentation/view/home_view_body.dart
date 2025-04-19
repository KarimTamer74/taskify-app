import 'package:flutter/material.dart';
import 'package:todo_app/core/extensions/app_theme_ext.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/app_styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(),
        Center(
          child: Image.asset(
            AppImages.homeChecklistImage,
            // width: 280.w,
            // height: 280.h,
            scale: 2.5,
          ),
        ),
        Text(
          AppStrings.homeTitle,
          style: AppStyles.textStyle20,
        ),
        15.vGap,
        Text(
          AppStrings.homeSubTitle,
          style: AppStyles.textStyle16.copyWith(
            color: context.isDarkMode
                ? AppColors.greyShade500
                : AppColors.greyShade600,
          ),
        ),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
