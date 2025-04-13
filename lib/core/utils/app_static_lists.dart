import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/features/add_task/data/models/task_category_model.dart';
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

    static List<TaskCategoryModel> categories = [
    TaskCategoryModel(
        categoryName: AppStrings.grocery,
        iconPath: AppIcons.groceryIcon,
        categoryColor: AppColors.groceryColor.toARGB32()),
    TaskCategoryModel(
        categoryName: AppStrings.work,
        iconPath: AppIcons.workIcon,
        categoryColor: AppColors.workColor.toARGB32()),
    TaskCategoryModel(
        categoryName: AppStrings.sport,
        iconPath: AppIcons.sportIcon,
        categoryColor: AppColors.sportsColor.toARGB32()),
    TaskCategoryModel(
        categoryName: AppStrings.design,
        iconPath: AppIcons.designIcon,
        categoryColor: AppColors.designColor.toARGB32()),
    TaskCategoryModel(
        categoryName: AppStrings.university,
        iconPath: AppIcons.universityIcon,
        categoryColor: AppColors.universityColor.toARGB32()),
    TaskCategoryModel(
        categoryName: AppStrings.social,
        iconPath: AppIcons.socialIcon,
        categoryColor: AppColors.socialColor.toARGB32()),
    TaskCategoryModel(
        categoryName: AppStrings.music,
        iconPath: AppIcons.musicIcon,
        categoryColor: AppColors.musicColor.toARGB32()),
    TaskCategoryModel(
        categoryName: AppStrings.movie,
        iconPath: AppIcons.movieIcon,
        categoryColor: AppColors.movieColor.toARGB32()),
    TaskCategoryModel(
        categoryName: AppStrings.health,
        iconPath: AppIcons.healthIcon,
        categoryColor: AppColors.healthColor.toARGB32()),
  ];

}
