import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaslocator/core/utils/app_colors.dart';
import 'package:gaslocator/features/registration/presentation/widgets/general_button.dart';

class BookingItem extends StatelessWidget {
  const BookingItem({
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
          child: Padding(
            padding: const EdgeInsets.all(10).r,
            child: Column(
              children: [
                const BookingRow(
                  lable: "Booking ID : ",
                  text: "111",
                ),
                const BookingRow(
                  lable: "Gas type : ",
                  text: "Aman",
                ),
                const BookingRow(
                  lable: "Quantity : ",
                  text: "2",
                ),
                const BookingRow(
                  lable: "The remaining time : ",
                  text: "Time out",
                ),
                SizedBox(
                  width: double.infinity,
                  child: GeneralButton(
                    text: 'Cancel',
                    onTap: () {},
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class BookingRow extends StatelessWidget {
  const BookingRow({
    super.key,
    required this.lable,
    required this.text,
  });
  final String lable;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(lable,
            style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp)),
        Expanded(
          child: Text(text, style: TextStyle(fontSize: 18.sp)),
        )
      ],
    );
  }
}
