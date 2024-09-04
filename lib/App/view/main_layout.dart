import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaslocator/App/bloc/app_bloc.dart';
import 'package:gaslocator/core/utils/app_colors.dart';
import 'package:gaslocator/core/utils/assets_manager.dart';
import 'package:gaslocator/features/owner%20part/direct%20sale/presentation/page/direct_sale_view.dart';
import 'package:gaslocator/features/owner%20part/manage%20bookings/presentation/page/manage_booking_view.dart';
import 'package:gaslocator/features/owner%20part/my%20center/presentation/pages/mycenter_view.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

List<Widget> mainpages = [
  const Center(
    child: DirectSaleView(),
  ),
  const Center(
    child: ManageBookingView(),
  ),
  const MyCenterView()
];

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          body: mainpages[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColors.background,
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primary,
            onTap: (index) => setState(() {
              currentIndex = index;
            }),
            items: [
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  ImgAssets.directSale1,
                  height: 35,
                ),
                icon: Image.asset(
                  ImgAssets.directSale,
                  height: 30,
                ),
                label: 'Direct sale',
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  ImgAssets.manBooking1,
                  height: 35,
                ),
                icon: Image.asset(
                  ImgAssets.manBooking,
                  height: 30,
                ),
                label: 'Manage booking',
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  ImgAssets.myCenter1,
                  height: 35,
                ),
                icon: Image.asset(
                  ImgAssets.myCenter,
                  height: 30,
                ),
                label: 'My ceter',
              ),
            ],
          ),
        );
      },
    );
  }
}
