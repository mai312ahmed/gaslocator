import 'package:flutter/material.dart';
import 'package:gaslocator/core/utils/assets_manager.dart';
import '../../config/routes/app_routes.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, Routes.login);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset(ImgAssets.logo)));
  }
}
