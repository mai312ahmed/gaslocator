import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaslocator/config/routes/app_routes.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
            child: Column(children: [
              SizedBox(
                height: 300.h,
              ),
              CustomFormField(
                  iconData: Icons.email,
                  validator: (val) {
                    if (val!.length < 12) {
                      return "email can't be less than 12 letters";
                    }
                    return null;
                  },
                  hintText: "Enter your email",
                  label: "Email"),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: double.infinity,
                child: GeneralButton(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.login);
                  },
                  text: 'Reset password',
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
