import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaslocator/App/bloc/app_bloc.dart';
import 'package:gaslocator/config/routes/app_routes.dart';
import 'package:gaslocator/core/widgets/helper_method.dart';
import 'package:gaslocator/features/registration/presentation/cubit/registration_cubit.dart';
import '../../../../config/locale/app_localizations.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(
                  Icons.translate,
                  color: AppColors.background,
                ),
                onPressed: () {
                  if (AppLocalizations.of(context)!.isEnLocale) {
                    context.read<AppBloc>().add(ChangeLocalToArabic());
                  } else {
                    context.read<AppBloc>().add(ChangeLocalToEnglish());
                  }
                }),
          ),
          body: BlocListener<RegistrationCubit, RegistrationState>(
            listener: (context, state) {
              if (state.status == RegistrationStatus.failure) {
                HelperMethod.showSnackBar(
                  context,
                  state.errorMessage,
                  type: SnackBarType.error,
                );
              }
              if (state.status == RegistrationStatus.success) {
                HelperMethod.showSnackBar(
                  context,
                  "Login successfully",
                  type: SnackBarType.success,
                );
                Navigator.pushNamed(context, Routes.signUp);
              }
            },
            child: LoginViewBody(),
          ),
        );
      },
    );
  }
}
