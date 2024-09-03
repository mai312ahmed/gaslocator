// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class AppView extends StatelessWidget {
//   const AppView({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(430, 932),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (_, context) {
//         return MaterialApp.router(
//           debugShowCheckedModeBanner: false,
//           theme: ThemeData(
//            // textTheme: GoogleFonts.ibmPlexSansArabicTextTheme(),
//             appBarTheme: const AppBarTheme(color: Colors.white),
//             colorScheme: ColorScheme.fromSwatch(
//               accentColor: const Color(0xFF7432FF),
//             ),
//             scaffoldBackgroundColor: Colors.white,
//           ),

//           // localizationsDelegates: AppLocalizations.localizationsDelegates,
//           locale: const Locale('ar', 'SA'),
//           localizationsDelegates: const [
//             GlobalMaterialLocalizations.delegate,
//             GlobalWidgetsLocalizations.delegate,
//             GlobalCupertinoLocalizations.delegate,
//           ],
//           supportedLocales: const [
//             Locale('ar', 'SA'),
//           ],
//           routerDelegate: AppRouter.router.routerDelegate,
//           routeInformationParser: AppRouter.router.routeInformationParser,
//           routeInformationProvider: AppRouter.router.routeInformationProvider,
//         );
//       },
//     );
//   }
// }
