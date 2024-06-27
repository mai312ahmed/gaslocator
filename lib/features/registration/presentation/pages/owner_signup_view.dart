import "package:flutter/material.dart";
import '../widgets/owner_signup_view_body.dart';

class OwnerSignupView extends StatelessWidget {
  const OwnerSignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OwnerSignupViewBody(),
    );
  }
}
