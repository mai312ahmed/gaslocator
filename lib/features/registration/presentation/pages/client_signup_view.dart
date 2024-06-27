import "package:flutter/material.dart";
import '../widgets/client_signup_view_body.dart';

class ClientSignupView extends StatelessWidget {
  const ClientSignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClientSignupViewBody(),
    );
  }
}
