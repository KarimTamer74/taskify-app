import 'package:flutter/material.dart';
import 'package:todo_app/core/extensions/sizedbox_extensions.dart';
import 'package:todo_app/features/settings/presentation/widgets/about_section.dart';
import 'package:todo_app/features/settings/presentation/widgets/account_section.dart';
import 'package:todo_app/features/settings/presentation/widgets/profile_section.dart';
import 'package:todo_app/features/settings/presentation/widgets/settings_section.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 10, 20),
        child: Column(
          children: [
            //* profile section
            ProfileSection(),
            20.vGap,
            //* settings section
            SettingsSection(),
            10.vGap,
            //* Account section
            AccountSection(),
            10.vGap,
            //* About section
            AboutSection()
          ],
        ),
      ),
    );
  }
}
