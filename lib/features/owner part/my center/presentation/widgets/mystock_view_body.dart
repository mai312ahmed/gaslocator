import 'package:flutter/material.dart';
import 'package:gaslocator/features/owner%20part/my%20center/presentation/widgets/mystock_list_item.dart';

class MyStockViewBody extends StatelessWidget {
  const MyStockViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return MyStockListItem(
            image: 'assets/images/${index + 1}.png',
            title: 'Aman',
            subTitle: '33',
            onTap: () {},
          );
        },
      ),
    ));
  }
}
