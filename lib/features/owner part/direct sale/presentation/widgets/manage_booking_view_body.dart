import 'package:flutter/material.dart';
import 'package:gaslocator/features/owner%20part/direct%20sale/presentation/widgets/direct_sale_list_item.dart';

class DirectSaleViewBody extends StatelessWidget {
  const DirectSaleViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SearchBar(
            hintText: "Search",
            onChanged: (value) {},
            leading: const Icon(Icons.search),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: 12,
              itemBuilder: (context, index) {
                return DirectSaleItem(
                  image: 'assets/images/${index + 1}.png',
                  title: 'Aman',
                  subTitle: '33',
                  onTap: () {},
                );
              },
            ),
          )),
        ],
      ),
    );
  }
}
