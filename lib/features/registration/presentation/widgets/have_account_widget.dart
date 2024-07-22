import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

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
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 17),
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              registrationType,
              style: TextStyle(
                  fontSize: 17,
                  color: AppColors.lines,
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
