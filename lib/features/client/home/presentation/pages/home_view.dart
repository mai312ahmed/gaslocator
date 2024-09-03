import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:gaslocator/config/routes/app_routes.dart";
import "package:gaslocator/features/client/home/presentation/widgets/home_view_body.dart";

class ClientHomePageView extends StatelessWidget {
  const ClientHomePageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Centers locations',
            style: TextStyle(color: Colors.black),
          )),
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(
              height: 500,
            ),
            ListTile(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, Routes.login);
              },
              title: const Text('logout'),
              trailing: const Icon(Icons.logout),
            ),
          ],
        ),
      ),
      body: const ClientHomePageViewBody(),
    );
  }
}
