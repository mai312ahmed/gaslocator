import "package:flutter/material.dart";
import "../widgets/mystock_view_body.dart";

class MyStockView extends StatelessWidget {
  const MyStockView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            ' My Stock',
            style: TextStyle(color: Colors.black),
          )),
      body: const MyStockViewBody(),
    );
  }
}
