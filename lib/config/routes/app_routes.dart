import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaslocator/App/bloc/app_bloc.dart';
import 'package:gaslocator/App/view/main_layout.dart';
import 'package:gaslocator/core/utils/app_strings.dart';
import 'package:gaslocator/enums/user_type.dart';
import 'package:gaslocator/features/client/home/presentation/cubits/home_cubit.dart';
import 'package:gaslocator/features/client/home/presentation/pages/home_view.dart';
import 'package:gaslocator/features/owner%20part/center%20settings/presentation/center%20settings%20cubit/center_settings_cubit.dart';
import 'package:gaslocator/features/owner%20part/center%20settings/presentation/pages/center_settings_view.dart';
import 'package:gaslocator/features/owner%20part/manage%20bookings/presentation/cubit/manage_booking_cubit.dart';
import 'package:gaslocator/features/owner%20part/manage%20bookings/presentation/page/manage_booking_view.dart';
import 'package:gaslocator/features/owner%20part/my%20account/presentation/my%20acoubt%20cubit/myaccount_cubit.dart';
import 'package:gaslocator/features/owner%20part/my%20account/presentation/pages/myaccount_view.dart';
import 'package:gaslocator/features/owner%20part/my%20center/presentation/pages/mystock_view.dart';
import 'package:gaslocator/features/owner%20part/my%20center/presentation/widgets/mycenter_view_body.dart';
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
  static const String clientHome = 'client home';
  static const String ownerHome = 'owner home';
  static const String directSale = 'direct sale';
  static const String manageBooking = 'manage booking';
  static const String myCenter = 'my center';
  static const String centerSettings = 'center settings';
  static const String myStock = 'my stock';
  static const String myAccount = 'my account';
  static const String updateStock = 'update stock';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: ((context) {
          //  return const Onboarding();
          if (context.read<AppBloc>().state.status ==
              AppStatus.unauthenticated) {
            return BlocProvider(
              create: (context) => di.sl<RegistrationCubit>(),
              child: const LoginView(),
            );
          }
          if (context.read<AppBloc>().state.user!.type == UserType.owner.name) {
            return const MainLayout();
          }
          return const ClientHomePageView();
        }));
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
      case Routes.ownerHome:
        return MaterialPageRoute(builder: ((context) => const MainLayout()));
      case Routes.centerSettings:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => di.sl<CenterSettingsCubit>(),
                  child: const CenterSettingsView(),
                )));
      case Routes.myStock:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => di.sl<CenterSettingsCubit>(),
                  child: const MyStockView(),
                )));
      case Routes.updateStock:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => di.sl<CenterSettingsCubit>(),
                  child: const ProductListScreen(),
                )));
      case Routes.myAccount:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => di.sl<MyAccountCubit>(),
                  child: const MyAccountView(),
                )));
      case Routes.manageBooking:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => di.sl<ManageBookingCubit>(),
                  child: const ManageBookingView(),
                )));

      case Routes.clientHome:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => di.sl<ClientHomeCubit>(),
                  child: const ClientHomePageView(),
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
