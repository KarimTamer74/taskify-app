import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/cubit/theme/theme_cubit.dart';
import 'package:todo_app/core/extensions/app_theme_ext.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/features/settings/presentation/widgets/custom_switch_list_tile.dart';

class SettingsSection extends StatefulWidget {
  const SettingsSection({
    super.key,
  });

  @override
  State<SettingsSection> createState() => _SettingsSectionState();
}

class _SettingsSectionState extends State<SettingsSection> {
  bool notificationValue = false;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = context.isDarkMode;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.settings, style: AppStyles.textStyleBold18),
        // 8.vGap,
        CustomSwitchListTile(
          title: AppStrings.notifications,
          iconData: notificationValue
              ? Icons.notifications_on
              : Icons.notifications_off,
          onChanged: (newValue) {
            setState(() {
              notificationValue = newValue;
            });
          },
          value: notificationValue,
        ),
        CustomSwitchListTile(
          title: AppStrings.themeMode,
          iconData: isDarkMode ? Icons.dark_mode : Icons.light_mode,
          onChanged: (newValue) {
            BlocProvider.of<ThemeCubit>(context)
                .changeTheme(isDarkMode ? ThemeMode.light : ThemeMode.dark);
          },
          value: isDarkMode,
        ),
      ],
    );
  }
}
