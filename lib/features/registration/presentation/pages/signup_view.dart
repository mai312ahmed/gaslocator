import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaslocator/config/routes/app_routes.dart';
import 'package:gaslocator/core/widgets/helper_method.dart';
import 'package:gaslocator/features/registration/presentation/cubit/registration_cubit.dart';
import '../widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "Sign up successfully , we will send you the verify code please check your email",
              type: SnackBarType.success,
            );
            Navigator.pushNamed(context, Routes.login);
          }
        },
        child: SignupViewBody(),
      ),
    );
  }
}
