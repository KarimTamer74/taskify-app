import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/features/settings/presentation/widgets/custom_list_tile.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.appName, style: AppStyles.textStyleBold18),
        CustomListTile(
            leadingIcon: AppIcons.menuIcon,
            title: AppStrings.aboutUs,
            onTap: () {}),
        CustomListTile(
            leadingIcon: AppIcons.infoIcon,
            title: AppStrings.faq,
            onTap: () {}),
        CustomListTile(
            leadingIcon: AppIcons.flashIcon,
            title: AppStrings.helpAndSupport,
            onTap: () {}),
        CustomListTile(
            leadingIcon: AppIcons.likeIcon,
            title: AppStrings.rateUs,
            onTap: () {}),
      ],
    );
  }
}
