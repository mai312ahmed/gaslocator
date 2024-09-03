import "package:flutter/material.dart";
import "package:gaslocator/features/owner%20part/my%20account/presentation/widgets/myaccount_view_body.dart";

class MyAccountView extends StatelessWidget {
  const MyAccountView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'My Account',
            style: TextStyle(color: Colors.black),
          )),
      body: const MyAccountViewBody(),
    );
  }
}
