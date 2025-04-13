import 'package:flutter/material.dart';
import 'package:todo_app/core/routing/routes.dart';
import 'package:todo_app/core/shared_widgets/custom_elevated_button.dart';
import 'package:todo_app/core/shared_widgets/custom_text_button.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';

class BackAndNextOnBoardingButtons extends StatelessWidget {
  const BackAndNextOnBoardingButtons({
    super.key,
    required this.controller,
    required this.isLastPage,
  });

  final PageController controller;
  final bool isLastPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextButton(
          text: AppStrings.back,
          onPressed: () {
            controller.previousPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
        ),
        CustomElevatedButton(
          text: isLastPage ? AppStrings.getStarted : AppStrings.next,
          backgroundColor: AppColors.primaryBlueClr,
          onPressed: () => {
            if (isLastPage)
              {
                Navigator.pushReplacementNamed(
                  context,
                  Routes.mainView,
                )
              }
            else
              {
                controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                )
              }
          },
        ),
      ],
    );
  }
}
