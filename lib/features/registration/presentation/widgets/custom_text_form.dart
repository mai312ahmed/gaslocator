import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaslocator/core/utils/app_colors.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    super.key,
    required this.label,
    this.hintText,
    this.keyboardType,
    this.maxLines = 1,
    this.onChanged,
    this.isPassword = false,
    this.suffixIcon,
    this.value,
    this.initialValue,
    this.validator,
    required this.iconData,
    this.errorText,
  });

  final String? Function(String?)? validator;
  final int? maxLines;
  final IconData iconData;
  final Widget? suffixIcon;
  final String? hintText;
  final String label;
  final TextInputType? keyboardType;
  final String? errorText;
  final void Function(String)? onChanged;
  final bool isPassword;
  final String? value;
  final String? initialValue;
  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value)
      ..addListener(() {
        widget.onChanged?.call(_controller.text);
      });
  }

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        validator: widget.validator,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        initialValue: widget.initialValue,
        maxLines: widget.isPassword ? 1 : widget.maxLines,
        // cursorColor: AppColors.lines,
        keyboardType: widget.keyboardType,
        controller: _controller,
        obscureText: widget.isPassword && _obscureText,
        decoration: InputDecoration(
          fillColor: AppColors.background,
          filled: true,
          errorMaxLines: 2,
          label: Text(
            widget.label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          hintStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            //   color: AppColors.lines,
          ),
          prefixIcon: Icon(
            widget.iconData,
            color: AppColors.primary,
            size: 25.sp,
          ),
          suffixIcon: widget.isPassword
              ? InkWell(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.primary,
                    size: 25.sp,
                  ),
                )
              : widget.suffixIcon,
          hintText: widget.hintText,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ).r,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              const Radius.circular(50).r,
            ),
            borderSide: const BorderSide(),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                const Radius.circular(50).r,
              ),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              const Radius.circular(50).r,
            ),
            borderSide: BorderSide(
              color: AppColors.primary,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              const Radius.circular(50).r,
            ),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
