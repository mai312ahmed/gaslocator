import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaslocator/core/utils/app_colors.dart';

class DirectSaleItem extends StatelessWidget {
  const DirectSaleItem({
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
      padding: EdgeInsets.symmetric(vertical: 5.h), // Adjusted padding
      child: Material(
        color: Colors.white,
        elevation: 5,
        shadowColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r), // Adjusted border radius
        ),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(10.r), // Adjusted padding
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align items to the top
              children: [
                Image.asset(
                  image,
                  width: 70.w,
                  height: 70.h,
                ),
                SizedBox(width: 10.w), // Add space between image and text
                const Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to start
                    children: [
                      BookingRow(
                        label: "Gas type : ",
                        text: "Aman",
                      ),
                      BookingRow(
                        label: "The total inventory : ",
                        text: "99999",
                      ),
                      BookingRow(
                        label: "Available : ",
                        text: "8888",
                      ),
                      BookingRow(
                        label: "Booked : ",
                        text: "122",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    width: 10.w), // Space between text and the second image
                const QuantitySection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class QuantitySection extends StatelessWidget {
  const QuantitySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary),
            borderRadius:
                BorderRadius.vertical(top: const Radius.circular(15).r)),
        child: InkWell(onTap: () {}, child: const Icon(Icons.add)),
      ),
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary),
            borderRadius:
                BorderRadius.vertical(bottom: const Radius.circular(15).r)),
        child: InkWell(onTap: () {}, child: const Icon(Icons.remove)),
      ),
      SizedBox(
        height: 10.h,
      ),
      const Text(
        "4444",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ]);
  }
}

class BookingRow extends StatelessWidget {
  const BookingRow({
    super.key,
    required this.label,
    required this.text,
  });

  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: 2.h), // Adjust spacing between rows
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp, // Adjusted font size
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16.sp), // Adjusted font size
              overflow: TextOverflow.ellipsis, // Prevent overflow
            ),
          ),
        ],
      ),
    );
  }
}
