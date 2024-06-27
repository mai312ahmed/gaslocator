import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gaslocator/config/routes/app_routes.dart';
import 'package:gaslocator/features/registration/presentation/cubit/registration_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import 'custom_text_form.dart';
import 'general_button.dart';
import 'have_account_widget.dart';
import 'logo_image_wedget.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({
    Key? key,
  }) : super(key: key);
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocConsumer<RegistrationCubit, RegistrationState>(
            listener: (context, state) {
      if (state.status == RegistrationStatus.inProgress) {
        showDialog(
            context: context,
            builder: (context) {
              return const SpinKitPouringHourGlassRefined(
                color: Colors.white,
              );
            });
      }
      if (state.status == RegistrationStatus.failure) {
        Navigator.pop(context);
        Fluttertoast.showToast(msg: state.errorMessage);
      }
      if (state.status == RegistrationStatus.success) {
        Navigator.pop(context);
        Fluttertoast.showToast(msg: "Login successfully");
        Navigator.pushNamed(context, Routes.ownerSignUp);
      }
    }, builder: (BuildContext context, RegistrationState state) {
      return SingleChildScrollView(
        child: Form(
          key: formState,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
            child: Column(children: [
              SizedBox(
                height: 60.h,
              ),
              const LogoImageWidget(),
              SizedBox(
                height: 20.h,
              ),
              CustomFormField(
                  onChanged: (value) {
                    context.read<RegistrationCubit>().emailChanged(value);
                  },
                  iconData: Icons.email,
                  validator: context.read<RegistrationCubit>().emailValidation,
                  hintText: "Enter your email",
                  label: "Email"),
              const SizedBox(
                height: 10,
              ),
              CustomFormField(
                onChanged: (value) {
                  context.read<RegistrationCubit>().passwordChanged(value);
                },
                isPassword: true,
                hintText: "Enter your password",
                label: "Password",
                iconData: Icons.lock,
                suffixIcon: const Icon(Icons.visibility),
                validator: context.read<RegistrationCubit>().passwordValidation,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, Routes.forgetPassword);
                    },
                    child: Text(
                      "Forget password?",
                      style: TextStyle(
                        fontSize: 17,
                        color: AppColors.light,
                      ),
                    )),
              ),
              SizedBox(
                width: double.infinity,
                child: GeneralButton(
                  onTap: state.status == RegistrationStatus.inProgress
                      ? null
                      : () {
                          if (formState.currentState!.validate()) {
                            BlocProvider.of<RegistrationCubit>(context)
                                .loginWithEmail();
                          }
                        },
                  text: 'Login',
                ),
              ),
              HaveAccountWidget(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.chooseRegistrationType);
                },
                registrationType: 'Sign up',
                text: "Don't have an account?",
              )
            ]),
          ),
        ),
      );
    }));
  }
}
