import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/values_manager.dart';
import '../cubit/registration_cubit.dart';
import 'custom_text_form.dart';
import 'general_button.dart';
import 'have_account_widget.dart';
import 'logo_image_wedget.dart';

class ClientSignupViewBody extends StatelessWidget {
  ClientSignupViewBody({
    Key? key,
  }) : super(key: key);
  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  //  adddata()async{
  //    CollectionReference ref1 = FirebaseFirestore.instance.collection("view list");
  //    ref1.doc(FirebaseAuth.instance.currentUser!.uid).set({
  //      "x":null,
  //      "y":null,
  //      "owner id":null,
  //    });
  //    CollectionReference ref2 = FirebaseFirestore.instance.collection("user");
  //    ref2.doc(FirebaseAuth.instance.currentUser!.uid).set({
  //      "user name":myusername,
  //      "email":myemail,
  //       "phone NO":myphone,
  //      "user type": 1,
  //      "booking":0,
  //      "book timeout":0,
  //    });
  //  }
  //GlobalKey<FormState> formState= GlobalKey<FormState>();
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
        Fluttertoast.showToast(msg: "Signup successfully");
        Navigator.pushNamed(context, Routes.login);
      }
    }, builder: (context, state) {
      return SingleChildScrollView(
        child: Form(
          key: formState,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(children: [
              const SizedBox(
                height: 60,
              ),
              const LogoImageWidget(),
              const SizedBox(
                height: AppSize.s20,
              ),
              CustomFormField(
                onChanged: (value) {
                  context.read<RegistrationCubit>().userNameChanged(value);
                },
                iconData: Icons.person,
                validator: context.read<RegistrationCubit>().nameValidation,
                hintText: "Enter your name",
                label: "User name",
              ),
              CustomFormField(
                  onChanged: (value) {
                    context.read<RegistrationCubit>().emailChanged(value);
                  },
                  iconData: Icons.email,
                  validator: context.read<RegistrationCubit>().emailValidation,
                  hintText: "Enter your email",
                  label: "Email"),
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
              const SizedBox(
                height: AppSize.s20,
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
                  text: 'Sign up',
                ),
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
