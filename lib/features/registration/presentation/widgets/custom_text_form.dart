// import 'package:flutter/material.dart';
// import '../../../../core/utils/app_colors.dart';
// import '../../../../core/utils/values_manager.dart';

// class CustomFormField extends StatelessWidget {
//   const CustomFormField({
//     Key? key,
//     required this.onSaved,
//     required this.validator,
//     required this.maxLength,
//     required this.iconData,
//     this.suffixIcon,
//     required this.hintText,
//     required this.label,
//     this.keyboardType,

//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextFormField(
//           cursorColor: AppColors.orange,
//           keyboardType: keyboardType,
//           onSaved: onSaved,
//           validator: validator,
//           maxLength: maxLength,
//           decoration: InputDecoration(
// errorText: widget.errorText,
//             prefixIcon: Icon(
//               iconData,
//               size: 30,
//             ),
//             suffixIcon: suffixIcon,
//             hintText: hintText,
//             label: Text(
//               label,
//               style: const TextStyle(fontSize: AppSize.s20),
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: AppSize.s4,
//         )
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: widget.validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            initialValue: widget.initialValue,
            maxLines: widget.isPassword ? 1 : widget.maxLines,
            cursorColor: AppColors.orange,
            keyboardType: widget.keyboardType,
            controller: _controller,
            obscureText: widget.isPassword && _obscureText,
            decoration: InputDecoration(
              errorMaxLines: 2,
              label: Text(
                widget.label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFFCFD2D4),
              ),
              prefixIcon: Icon(
                widget.iconData,
                size: 25,
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
                        color: AppColors.orange,
                        size: 25,
                      ),
                    )
                  : widget.suffixIcon,
              hintText: widget.hintText,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(
                  color: AppColors.orange,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(
                  color: AppColors.orange,
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
