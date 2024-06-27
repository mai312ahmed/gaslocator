import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaslocator/core/utils/app_strings.dart';
import 'package:gaslocator/core/widgets/splash.dart';
import 'package:gaslocator/features/registration/presentation/pages/client_signup_view.dart';
import 'package:gaslocator/features/registration/presentation/pages/owner_signup_view.dart';
import "package:gaslocator/injection_container.dart" as di;
import '../../features/registration/presentation/cubit/registration_cubit.dart';
import '../../features/registration/presentation/pages/forget_password_view.dart';
import '../../features/registration/presentation/pages/login_view.dart';
import '../../features/registration/presentation/pages/registration_type_view.dart';

class Routes {
  static const String initialRoute = '/';
  static const String clientSignUp = 'client sign up';
  static const String ownerSignUp = 'owner sign up';
  static const String chooseRegistrationType = 'choose registration Type';
  static const String login = 'login';
  static const String forgetPassword = 'forget password';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: ((context) => const Splash()));
      case Routes.chooseRegistrationType:
        return MaterialPageRoute(
            builder: ((context) => const RegistrationTypeView()));
      case Routes.clientSignUp:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => di.sl<RegistrationCubit>(),
                  child: const ClientSignupView(),
                )));
      case Routes.ownerSignUp:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => di.sl<RegistrationCubit>(),
                  child: const OwnerSignupView(),
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
