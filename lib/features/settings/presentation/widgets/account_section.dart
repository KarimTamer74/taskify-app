import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/features/settings/presentation/widgets/custom_list_tile.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.account, style: AppStyles.textStyleBold18),
          // 8.vGap,
          CustomListTile(
            leadingIcon: AppIcons.profileIcon,
            title: AppStrings.changeAccountName,
            onTap: () {},
          ),
          CustomListTile(
            leadingIcon: AppIcons.keyIcon,
            title: AppStrings.changeAccountPassword,
            onTap: () {},
          ),
          CustomListTile(
            leadingIcon: AppIcons.cameraIcon,
            title: AppStrings.changeAccountImage,
            onTap: () {},
          ),
        ]);
  }
}
