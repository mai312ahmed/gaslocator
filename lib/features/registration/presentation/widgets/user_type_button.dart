import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaslocator/core/utils/app_colors.dart';

class UserTypeButton extends StatelessWidget {
  const UserTypeButton({
    super.key,
    this.onTap,
    required this.text,
    required this.selected,
  });
  final void Function()? onTap;
  final String text;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: ((2.sw) / 5).w,
        padding: const EdgeInsets.symmetric(vertical: 10).r,
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : null,
          borderRadius: BorderRadius.circular(50).r,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: selected ? Colors.white : AppColors.primary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
