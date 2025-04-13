import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
  });
  final String? title;
  final Widget? leading;
  final Widget? actions;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 4.w, top: 14.h),
      child: AppBar(
        surfaceTintColor: AppColors.black,
        title: Text(title ?? '', style: AppStyles.textStyleBold20),
        centerTitle: true,
        leading: leading ??
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                style: IconButton.styleFrom(),
                icon: Icon(
                  Icons.dark_mode_outlined,
                  size: 30.sp,
                )),
        actions: [
          actions ??
              CircleAvatar(
                backgroundImage: AssetImage(AppImages.me),
                backgroundColor: AppColors.white,
                radius: 20.r,
              )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0.h);
}
