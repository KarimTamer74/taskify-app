import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/utils/app_styles.dart';

class CustomSwitchListTile extends StatefulWidget {
  const CustomSwitchListTile(
      {super.key,
      required this.title,
      required this.iconData,
      this.onChanged,
      required this.value});
  final String title;
  final IconData iconData;
  final void Function(bool)? onChanged;
  final bool value;
  @override
  State<CustomSwitchListTile> createState() => _CustomSwitchListTileState();
}

class _CustomSwitchListTileState extends State<CustomSwitchListTile> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
        contentPadding: EdgeInsets.all(0),
        activeColor: AppColors.bluishClr,
        title: Text(
          widget.title,
          style: AppStyles.textStyle16,
        ),
        secondary: Icon(widget.iconData),
        value: widget.value,
        onChanged: widget.onChanged );
  }
}
