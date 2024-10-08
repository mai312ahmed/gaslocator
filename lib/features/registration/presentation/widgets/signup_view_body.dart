import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaslocator/config/routes/app_routes.dart';
import 'package:gaslocator/core/utils/app_colors.dart';
import 'package:gaslocator/core/utils/assets_manager.dart';
import 'package:gaslocator/features/registration/presentation/cubit/registration_cubit.dart';
import 'package:gaslocator/features/registration/presentation/widgets/user_type_button.dart';
import 'custom_text_form.dart';
import 'general_button.dart';
import 'have_account_widget.dart';
import 'image_wedget.dart';

class SignupViewBody extends StatelessWidget {
  SignupViewBody({
    Key? key,
  }) : super(key: key);
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) {
      return SingleChildScrollView(
        child: Form(
          key: formState,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).r,
            child: Column(children: [
              SizedBox(
                height: 40.h,
              ),
              const ImageWidget(
                image: ImgAssets.signup,
              ),
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text('Registration',
                    style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 41.sp,
                        fontWeight: FontWeight.bold)),
              ),
              const TypeSection(),
              SizedBox(height: 20.h),
              CustomFormField(
                onChanged: (value) {
                  context.read<RegistrationCubit>().userNameChanged(value);
                },
                iconData: Icons.person,
                validator: context.read<RegistrationCubit>().nameValidation,
                hintText: "Enter your name",
                label: "User name",
              ),
              SizedBox(height: 20.h),
              CustomFormField(
                  onChanged: (value) {
                    context.read<RegistrationCubit>().emailChanged(value);
                  },
                  iconData: Icons.email,
                  validator: context.read<RegistrationCubit>().emailValidation,
                  hintText: "Enter your email",
                  label: "Email"),
              SizedBox(height: 20.h),
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
              SizedBox(height: 20.h),
              CustomFormField(
                onChanged: (value) {
                  context.read<RegistrationCubit>().confasswordChanged(value);
                },
                isPassword: true,
                hintText: "Enter your password",
                label: "Confirm password",
                iconData: Icons.lock,
                validator: context
                    .read<RegistrationCubit>()
                    .passwordMatchingValidation,
                suffixIcon: const Icon(Icons.visibility),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: double.infinity,
                child: GeneralButton(
                  onTap: state.status == RegistrationStatus.inProgress
                      ? null
                      : () {
                          if (formState.currentState!.validate()) {
                            BlocProvider.of<RegistrationCubit>(context)
                                .signupWithEmail();
                          }
                        },
                  text: 'Sign up',
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              HaveAccountWidget(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.login);
                },
                registrationType: 'Login',
                text: "Already have an account?",
              )
            ]),
          ),
        ),
      );
    }));
  }
}

class TypeSection extends StatelessWidget {
  const TypeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.background,
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(158, 0, 0, 0),
                  offset: Offset(2, 2),
                  blurRadius: 2),
            ],
            borderRadius: BorderRadius.circular(50).r,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UserTypeButton(
                selected: state.isClient,
                onTap: () {
                  context.read<RegistrationCubit>().setType(isClient: true);
                },
                text: 'Customer',
              ),
              UserTypeButton(
                selected: !state.isClient,
                onTap: () {
                  context.read<RegistrationCubit>().setType(isClient: false);
                },
                text: 'Owner',
              ),
            ],
          ),
        );
      },
    );
  }
}
