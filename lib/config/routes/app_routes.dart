import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaslocator/core/utils/app_strings.dart';
import 'package:gaslocator/core/widgets/splash.dart';
import 'package:gaslocator/features/registration/presentation/pages/signup_view.dart';
import "package:gaslocator/injection_container.dart" as di;
import '../../features/registration/presentation/cubit/registration_cubit.dart';
import '../../features/registration/presentation/pages/forget_password_view.dart';
import '../../features/registration/presentation/pages/login_view.dart';

class Routes {
  static const String initialRoute = '/';
  static const String signUp = 'sign up';
  static const String login = 'login';
  static const String forgetPassword = 'forget password';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: ((context) => const Splash()));
      case Routes.signUp:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => di.sl<RegistrationCubit>(),
                  child: const SignupView(),
                )));
      case Routes.login:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => di.sl<RegistrationCubit>(),
                  child: const LoginView(),
                )));
      case Routes.forgetPassword:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => di.sl<RegistrationCubit>(),
                  child: const ForgetPassWordView(),
                )));
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            )));
  }
}
