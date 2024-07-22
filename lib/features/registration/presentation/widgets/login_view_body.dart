import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaslocator/config/routes/app_routes.dart';
import 'package:gaslocator/core/utils/assets_manager.dart';
import 'package:gaslocator/features/registration/presentation/cubit/registration_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import 'custom_text_form.dart';
import 'general_button.dart';
import 'have_account_widget.dart';
import 'image_wedget.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({
    Key? key,
  }) : super(key: key);
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (BuildContext context, RegistrationState state) {
      return SingleChildScrollView(
        child: Form(
          key: formState,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
            child: Column(children: [
              const ImageWidget(
                image: ImgAssets.login,
              ),
              SizedBox(
                height: 100.h,
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
                        color: AppColors.lines,
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
                  Navigator.pushNamed(context, Routes.signUp);
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
