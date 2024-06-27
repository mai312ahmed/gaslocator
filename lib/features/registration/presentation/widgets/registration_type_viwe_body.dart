import 'package:flutter/material.dart';
import 'package:gaslocator/config/routes/app_routes.dart';
import 'package:gaslocator/core/utils/values_manager.dart';
import 'package:gaslocator/features/registration/presentation/widgets/general_button.dart';

class RegistrationTypeViewBody extends StatelessWidget {
  const RegistrationTypeViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Sign up as",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            child: GeneralButton(
                onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.clientSignUp);
                },
                text: "Client"),
          ),
          const SizedBox(
            height: 7,
          ),
          const Text(
            "or",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 7,
          ),
          SizedBox(
            width: double.infinity,
            child: GeneralButton(
                onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.ownerSignUp);
                },
                text: "Center Owner"),
          ),
        ],
      ),
    );
  }
}
