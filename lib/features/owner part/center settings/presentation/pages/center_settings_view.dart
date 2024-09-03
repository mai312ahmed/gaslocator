import "package:flutter/material.dart";
import "package:gaslocator/features/owner%20part/center%20settings/presentation/widgets/center_settings_view_body.dart";

class CenterSettingsView extends StatelessWidget {
  const CenterSettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Center Settings',
            style: TextStyle(color: Colors.black),
          )),
      body: const CentersettingsViewBody(),
    );
  }
}
