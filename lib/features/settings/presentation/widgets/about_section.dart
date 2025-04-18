import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_assets.dart';
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
        Text("Taskify", style: AppStyles.textStyleBold18),
        CustomListTile(
            leadingIcon: AppIcons.menuIcon, title: "About Us", onTap: () {}),
        CustomListTile(
            leadingIcon: AppIcons.infoIcon, title: "FAQ", onTap: () {}),
        CustomListTile(
            leadingIcon: AppIcons.flashIcon,
            title: "Help & Support",
            onTap: () {}),
        CustomListTile(
            leadingIcon: AppIcons.likeIcon, title: "Rate Us", onTap: () {}),
      ],
    );
  }
}
