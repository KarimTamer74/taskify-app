import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/features/onboarding/data/model/onboarding_content_model.dart';

abstract class AppStaticLists {
  static final List<OnboardingContentModel> onBoardingContents = [
    OnboardingContentModel(
        title: AppStrings.onboardingFirstTitle,
        description: AppStrings.onboardingFirstDesc,
        image: AppImages.onboardingFirstImage),
    OnboardingContentModel(
        title: AppStrings.onboardingSecondTitle,
        description: AppStrings.onboardingSecondDesc,
        image: AppImages.onboardingSecondImage),
    OnboardingContentModel(
        title: AppStrings.onboardingThirdTitle,
        description: AppStrings.onboardingThirdDesc,
        image: AppImages.onboardingThirdImage),
  ];
  static final List<String> reminderOptions = [
    '15 minutes before',
    '30 minutes before',
    '1 hour before',
    '1 day before',
    'No Reminder',
  ];

  static final List<String> repeatOptions = [
    'Daily',
    'Weekly',
    'Monthly',
    'Yearly',
    'No Repeat',
  ];
}
