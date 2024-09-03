import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaslocator/core/utils/app_colors.dart';

class CenterSettingsListItem extends StatelessWidget {
  const CenterSettingsListItem({
    Key? key,
    this.onTap,
    required this.title,
    this.subtitle,
    required this.icon,
  }) : super(key: key);
  final void Function()? onTap;
  final String title;
  final String? subtitle;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: AppColors.primary,
          ),
          onTap: onTap,
          title: Text(title),
          subtitle: Text(subtitle ?? 'It is not determined yet'),
          trailing: Icon(
            Icons.edit,
            color: AppColors.primary,
          ),
        ),
        Divider(indent: 50.w, color: Colors.grey)
      ],
    );
  }
}
