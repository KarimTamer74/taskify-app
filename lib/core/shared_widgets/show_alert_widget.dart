import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/core/utils/app_styles.dart';

Future<dynamic> showAlertDialog({
  required BuildContext context,
  required String title,
  required String buttonText,
  IconData? buttonIcon,
  required Color buttonColor,
  required void Function()? onOkPressed,
  void Function()? onCancelPressed,
}) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.black,
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: AppStyles.textStyleBold18,
        ),
        // content: Text(
        //   subTitle,
        //   textAlign: TextAlign.center,
        // ),
        actions: [
          ElevatedButton.icon(
            onPressed: onCancelPressed ?? () => Navigator.pop(context),
            label: Text("Continue",
                style: AppStyles.textStyle20
                    .copyWith(color: AppColors.primaryBlueClr)),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ),
          10.vGap,
          ElevatedButton.icon(
            onPressed: onOkPressed,
            label: Text(buttonText, style: AppStyles.textStyle20),
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ),
        ],
      );
    },
  );
}
