import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaslocator/core/utils/app_colors.dart';
import 'package:gaslocator/features/owner%20part/center%20settings/presentation/widgets/center_settings_list_item.dart';
import 'package:gaslocator/features/owner%20part/center%20settings/presentation/widgets/custom_show_bottom_sheet.dart';

class MyAccountViewBody extends StatelessWidget {
  const MyAccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(10).r,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150).r,
                border: Border.all(color: AppColors.primary, width: 5)),
            child: Icon(
              Icons.person,
              size: 150.sp,
              color: AppColors.primary,
            ),
          ),
          CenterSettingsListItem(
            title: 'My Name',
            icon: Icons.person,
            onTap: () {
              customShowBottomSheet(context,
                  lable: 'My name',
                  onSavePressed: () {},
                  onChanged: (value) {});
            },
          ),
          CenterSettingsListItem(
            title: 'My Email',
            icon: Icons.email,
            onTap: () {
              customShowBottomSheet(
                context,
                lable: 'Change my email',
                onSavePressed: () {},
                onChanged: (value) {},
              );
            },
          ),
          CenterSettingsListItem(
            title: 'Password',
            icon: Icons.password,
            onTap: () {
              customShowBottomSheet(
                context,
                lable: 'Change my password',
                onSavePressed: () {},
                onChanged: (value) {},
              );
            },
          ),
        ],
      ),
    );
  }
}
