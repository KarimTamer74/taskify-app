import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_styles.dart';

class CustomTitledListTile extends StatelessWidget {
  const CustomTitledListTile({
    super.key,
    required this.headerTitle,
    required this.listTileTitle,
    required this.iconData,
    this.onpressed,
  });
  final String headerTitle, listTileTitle;
  final IconData iconData;
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headerTitle,
            style: AppStyles.textStyleBold18,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              listTileTitle,
              style: AppStyles.textStyle16,
            ),
            trailing: IconButton(
              icon: Icon(iconData),
              onPressed: onpressed,
            ),
          ),
        ]);
  }
}
