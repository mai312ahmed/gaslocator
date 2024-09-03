import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaslocator/core/utils/app_colors.dart';

class HaveAccountWidget extends StatelessWidget {
  const HaveAccountWidget({
    super.key,
    required this.text,
    required this.registrationType,
    required this.onPressed,
  });
  final String text;
  final String registrationType;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 18.sp,
            color: AppColors.secondartyLines,
          ),
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              registrationType,
              style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.items,
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
