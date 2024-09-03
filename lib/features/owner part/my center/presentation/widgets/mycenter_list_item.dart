import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaslocator/core/utils/app_colors.dart';

class MyCenterListItem extends StatelessWidget {
  const MyCenterListItem({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5).r,
      child: Material(
        elevation: 5,
        shadowColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15,
          ).r,
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
          ).r,
          onTap: onTap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              15,
            ).r,
          ),
          tileColor: Colors.white,
          title: Text(
            text,
            style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.primary),
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: const Color(0xff999999),
            size: 24.sp,
          ),
        ),
      ),
    );
  }
}
