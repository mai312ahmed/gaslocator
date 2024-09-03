import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaslocator/core/utils/app_colors.dart';
import 'package:gaslocator/features/owner%20part/center%20settings/presentation/widgets/custom_show_bottom_sheet.dart';

PersistentBottomSheetController gasShowBottomSheet(
  BuildContext context, {
  required void Function() onSavePressed,
}) {
  return showBottomSheet(
      backgroundColor: Colors.white,
      showDragHandle: true,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'My Gas',
                style: TextStyle(fontSize: 18.sp),
              ),
              Wrap(
                  children: List.generate(
                12,
                (int index) => CheckboxListTile(
                  fillColor: WidgetStateProperty.all(AppColors.primary),
                  value: true,
                  onChanged: (value) {},
                  title: Row(
                    children: [
                      Image.asset(
                        'assets/images/${index + 1}.png',
                        height: 50.h,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      const Text('Abarsi'),
                    ],
                  ),
                ),
              )),
              SaveCancelButtom(
                onSavePressed: onSavePressed,
              )
            ],
          ),
        );
      });
}
