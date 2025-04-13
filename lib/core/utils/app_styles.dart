import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/theme/app_colors.dart';

abstract class AppStyles {
  static const textStyle14 = TextStyle(fontSize: 14);
  static const textStyle22 = TextStyle(fontSize: 22);
  static const textStyle20 = TextStyle(fontSize: 20); // regular font weight
  static TextStyle textStyleBold12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textStyleBold14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textStyle15 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textStyleBold15 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
  ); //
  static TextStyle textStyle16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  ); //medium font weight
  static TextStyle textStyleBold16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textStyle18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textStyleBold18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
  ); // medium font weight

  static TextStyle greyTextStyle14 = TextStyle(
    color: Colors.grey,
    fontSize: 14.sp,
  );
  static TextStyle greyTextStyle16 = TextStyle(
    color: Colors.grey,
    fontSize: 16.sp,
  );
  static TextStyle greyTextStyle18 = TextStyle(
    color: Colors.grey,
    fontSize: 18.sp,
  );
  static TextStyle greyTextStyle20 = TextStyle(
    color: Colors.grey,
    fontSize: 20.sp,
  );
  static TextStyle greyTextStyle22 = TextStyle(
    color: Colors.grey,
    fontSize: 22.sp,
  );
  static TextStyle whiteTextStyle18 = TextStyle(
    color: Colors.white,
    fontSize: 18.sp,
  );
  static TextStyle whiteTextStyle20 = TextStyle(
    color: Colors.white,
    fontSize: 20.sp,
  ); // regular font weight
  static final textStyleBold20 =
      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold);
  static final textStyleBold22 =
      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold);
  static final textStyleBold24 =
      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold);
  static final textStyleBold26 =
      TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold);
  static final textStyleBold28 =
      TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold);
  static final textStyleBold30 =
      TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold);
  static TextStyle whiteTextStyle24 = TextStyle(
      fontSize: 24.sp, fontWeight: FontWeight.bold, color: AppColors.white);
  static TextStyle textStyleBold32 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
  );
}
