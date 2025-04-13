import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';

class OnboardingPageViewBody extends StatefulWidget {
  final String title;
  final String description;
  final String image;
  final int pageIndex;
  final Function(int)? selectedDotIndex;
  const OnboardingPageViewBody(
      {super.key,
      required this.title,
      required this.description,
      required this.image,
      required this.pageIndex,
      this.selectedDotIndex});

  @override
  State<OnboardingPageViewBody> createState() => _OnboardingPageViewBodyState();
}

class _OnboardingPageViewBodyState extends State<OnboardingPageViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 2, child: Image.asset(widget.image)),
          30.vGap,
          Center(
            child: SizedBox(
              height: 8.h,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        widget.selectedDotIndex!(index);
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 8.h,
                      width: index == widget.pageIndex ? 26.w : 8.w,
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      decoration: BoxDecoration(
                        color: index == widget.pageIndex
                            ? AppColors.primaryBlueClr
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          10.vGap,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: AppStyles.textStyleBold26,
                ),
                20.vGap,
                Text(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: AppStyles.greyTextStyle18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
