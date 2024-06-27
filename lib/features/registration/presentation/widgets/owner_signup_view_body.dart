import 'package:flutter/material.dart';
import 'package:gaslocator/config/routes/app_routes.dart';
import '../../../../core/utils/values_manager.dart';
import 'custom_text_form.dart';
import 'general_button.dart';
import 'have_account_widget.dart';
import 'logo_image_wedget.dart';

class OwnerSignupViewBody extends StatelessWidget {
  const OwnerSignupViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(children: [
              const LogoImageWidget(),
              const SizedBox(
                height: AppSize.s20,
              ),
              CustomFormField(
                iconData: Icons.person,
                validator: (val) {
                  if (val!.length < 2) {
                    return "user name can't be less than 2 letters";
                  }
                  return null;
                },
                maxLines: 30,
                hintText: "Enter your name",
                label: "User name",
              ),
              CustomFormField(
                  iconData: Icons.email,
                  validator: (val) {
                    if (val!.length < 12) {
                      return "email can't be less than 12 letters";
                    }
                    return null;
                  },
                  maxLines: 40,
                  hintText: "Enter your email",
                  label: "Email"),
              CustomFormField(
                hintText: "Enter your phone number",
                label: "User phone",
                keyboardType: TextInputType.phone,
                iconData: Icons.phone_android,
                validator: (val) {
                  if (val!.length != 10) {
                    return "phone number should be 10 numbers";
                  }
                  return null;
                },
                maxLines: 10,
              ),
              CustomFormField(
                hintText: "Enter your password",
                label: "Password",
                iconData: Icons.lock,
                suffixIcon: const Icon(Icons.visibility),
                validator: (val) {
                  if (val!.length < 4) {
                    return "user name can't be less than 4 letters";
                  }
                  return null;
                },
                maxLines: 20,
              ),
              CustomFormField(
                hintText: "Enter your password",
                label: "Confirm password",
                iconData: Icons.lock,
                suffixIcon: const Icon(Icons.visibility),
                validator: (val) {
                  if (val!.length < 4) {
                    return "user name can't be less than 4 letters";
                  }
                  return null;
                },
                maxLines: 20,
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              GeneralButton(
                onTap: () {},
                text: 'Sign up',
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
      ),
    );
  }
}
