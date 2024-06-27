import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'injection_container.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyB2RiIMAeEcTMMKzrWzksumSvIGWnikYJo",
          appId: "1:750688308885:android:0e2caf4e1dd0f9e577959c",
          messagingSenderId: "750688308885",
          projectId: "gas-locator-9f6c7"));
  await FirebaseMessaging.instance.getToken();
  // معلومات المستخدم الحالي
//await userSharedPreferences.init();
  await init();

  runApp(const App());
}
