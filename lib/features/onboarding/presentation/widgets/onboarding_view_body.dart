import 'package:flutter/material.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/core/routing/routes.dart';
import 'package:todo_app/core/shared_widgets/custom_text_button.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/features/onboarding/presentation/widgets/back_and_next_onboarding_buttons.dart';
import 'package:todo_app/features/onboarding/presentation/widgets/onboarding_page_view.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        14.vGap,
        Align(
          alignment: Alignment.centerRight,
          child: CustomTextButton(
            text: AppStrings.skip,
            onPressed: () {
              Navigator.pushReplacementNamed(
                context,
                Routes.mainView,
              );
            },
          ),
        ),
        Expanded(
            child: OnboardingPageView(
          controller: controller,
          isLastPage: (value) {
            setState(() {
              isLastPage = value;
            });
          },
        )),
        40.vGap,
        BackAndNextOnBoardingButtons(
            controller: controller, isLastPage: isLastPage),
        40.vGap,
      ],
    );
  }
}
