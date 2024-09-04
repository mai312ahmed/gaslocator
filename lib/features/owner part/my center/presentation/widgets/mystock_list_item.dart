import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaslocator/core/utils/app_colors.dart';
import 'package:gaslocator/features/owner%20part/center%20settings/presentation/widgets/custom_show_bottom_sheet.dart';

class MyStockListItem extends StatelessWidget {
  const MyStockListItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
    required this.image,
  });

  final String title;
  final String subTitle;
  final String image;
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
          leading: Image.asset(image),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
          ).r,
          onTap: () {
            customShowBottomSheet(context, lable: "Add $title Stock with ",
                onSavePressed: () {
              onTap;
            },
                onChanged: (value) {},
                maxLength: 4,
                keyboardType: TextInputType.number);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              15,
            ).r,
          ),
          tileColor: Colors.white,
          title: Text(
            title,
            style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primary),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "all gas : $subTitle",
                style: TextStyle(fontSize: 17.sp, color: AppColors.primary),
              ),
              Text(
                "Available : $subTitle",
                style: TextStyle(fontSize: 17.sp, color: AppColors.primary),
              ),
              Text(
                "Booked : $subTitle",
                style: TextStyle(fontSize: 17.sp, color: AppColors.primary),
              ),
            ],
          ),
          trailing: Icon(
            Icons.edit,
            color: const Color(0xff999999),
            size: 24.sp,
          ),
        ),
      ),
    );
  }
}
