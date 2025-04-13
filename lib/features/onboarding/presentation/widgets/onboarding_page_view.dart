import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_static_lists.dart';
import 'package:todo_app/features/onboarding/presentation/widgets/onboarding_page_view_body.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({
    super.key,
    this.isLastPage,
    required this.controller,
  });
  final Function(bool)? isLastPage;
  final PageController controller;

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) {
        return OnboardingPageViewBody(
          pageIndex: index,
          selectedDotIndex: (index) {
            setState(() {
              widget.controller.jumpToPage(index);
            });
          },
          image: AppStaticLists.onBoardingContents[index].image,
          title: AppStaticLists.onBoardingContents[index].title,
          description: AppStaticLists.onBoardingContents[index].description,
        );
      },
      itemCount: 3,
      controller: widget.controller,
      physics: const BouncingScrollPhysics(),
      onPageChanged: (index) {
        setState(() {
          isLastPage = index == 2;
          widget.isLastPage!(isLastPage);
        });
      },
    );
  }
}
