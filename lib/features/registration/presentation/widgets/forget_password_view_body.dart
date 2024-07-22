import 'package:flutter/material.dart';
import 'package:gaslocator/config/routes/app_routes.dart';
import 'package:gaslocator/core/utils/values_manager.dart';
import 'package:gaslocator/features/registration/presentation/widgets/general_button.dart';
import 'custom_text_form.dart';

class ForgetPassWordViewBody extends StatelessWidget {
  const ForgetPassWordViewBody({
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
              const SizedBox(
                height: 100,
              ),
              const SizedBox(
                height: AppSize.s20,
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
              const SizedBox(
                height: 20,
              ),
              GeneralButton(
                onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.login);
                },
                text: 'Reset password',
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
