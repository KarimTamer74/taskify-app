import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/utils/app_styles.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.leadingIcon,
      required this.title,
      required this.onTap});
  final String leadingIcon;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      
      leading: SvgPicture.asset(leadingIcon),
      title: Text(title, style: AppStyles.textStyle16),
      trailing:
          IconButton(onPressed: onTap, icon: Icon(Icons.arrow_forward_ios)),
    );
  }
}
