import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/features/settings/presentation/widgets/custom_list_tile.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Settings", style: AppStyles.textStyleBold18),
        // 8.vGap,
        CustomListTile(
          leadingIcon: AppIcons.settingsIcon,
          title: "Settings",
          onTap: () {},
        )
      ],
    );
  }
}
