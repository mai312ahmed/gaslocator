import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';

class GeneralButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const GeneralButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50).r,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 5,
        ).r,
      ),
      onPressed: onTap,
      child: Text(text,
          style: TextStyle(
              color: AppColors.background,
              fontSize: 23.sp,
              fontWeight: FontWeight.w600)),
    );
  }
}
