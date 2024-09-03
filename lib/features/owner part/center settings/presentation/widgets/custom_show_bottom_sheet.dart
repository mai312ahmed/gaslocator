import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaslocator/core/utils/app_colors.dart';
import 'package:gaslocator/features/owner%20part/center%20settings/presentation/widgets/timing_text_feild.dart';

PersistentBottomSheetController customShowBottomSheet(
  BuildContext context, {
  required String lable,
  required void Function() onSavePressed,
  required void Function(String)? onChanged,
  bool isTiming = false,
  int maxLength = 50,
  TextInputType? keyboardType,
}) {
  return showBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0).r,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lable,
                style: TextStyle(fontSize: 18.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              isTiming
                  ? TimingTextFeild()
                  : TextField(
                      maxLength: maxLength,
                      keyboardType: keyboardType,
                      cursorColor: Colors.grey,
                      onChanged: onChanged,
                    ),
              SaveCancelButtom(
                onSavePressed: onSavePressed,
              )
            ],
          ),
        );
      });
}

class SaveCancelButtom extends StatelessWidget {
  const SaveCancelButtom({
    super.key,
    required this.onSavePressed,
  });
  final void Function() onSavePressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'cancel',
              style: TextStyle(color: AppColors.primary, fontSize: 15.sp),
            )),
        TextButton(
            onPressed: onSavePressed,
            child: Text('save',
                style: TextStyle(color: AppColors.primary, fontSize: 15.sp))),
      ],
    );
  }
}
