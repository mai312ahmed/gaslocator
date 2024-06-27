import 'package:gaslocator/App/bloc/app_bloc.dart';
import 'package:gaslocator/features/sitting/domain/repositories/lang_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/locale/app_localizations_setup.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'injection_container.dart' as di;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AppBloc(langRepository: di.sl<LangRepository>())..add(AppStarted()),
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, context) {
          return MaterialApp(
            locale: state.locale,
            title: AppStrings.appName,
            debugShowCheckedModeBanner: false,
            theme: appTheme(),
            onGenerateRoute: AppRoutes.onGenerateRoute,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
          );
        },
      );
    });
  }
}
