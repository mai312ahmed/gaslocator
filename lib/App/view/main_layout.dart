import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaslocator/App/bloc/app_bloc.dart';
import 'package:gaslocator/core/utils/assets_manager.dart';
import 'package:gaslocator/features/owner%20part/my%20center/presentation/pages/mycenter_view.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

List<Widget> mainpages = [
  GestureDetector(
    onTap: () async {
      await FirebaseAuth.instance.signOut();
      //Navigator.pushNamed(context, Routes.login)
    },
    child: const Center(
      child: Text("بيع مباشر"),
    ),
  ),
  const Center(
    child: Text("ادارة الحجوزات"),
  ),
  const MyCenterView()
  // const MyFavConnectionRequestPage(),
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
            backgroundColor: Colors.white,
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
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
