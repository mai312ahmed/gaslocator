import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaslocator/config/routes/app_routes.dart';
import 'package:gaslocator/core/utils/app_colors.dart';
import 'package:gaslocator/core/utils/assets_manager.dart';
import 'package:gaslocator/features/owner%20part/my%20center/presentation/cubit/my_center_cubit.dart';
import 'package:gaslocator/features/owner%20part/my%20center/presentation/widgets/mycenter_list_item.dart';

class MyCenterViewBody extends StatefulWidget {
  const MyCenterViewBody({
    Key? key,
  }) : super(key: key);
  @override
  State<MyCenterViewBody> createState() => _MyCenterViewBodyState();
}

class _MyCenterViewBodyState extends State<MyCenterViewBody> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<MyCenterCubit, MyCenterState>(
        builder: (BuildContext context, MyCenterState state) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Column(children: [
                Image.asset(
                  ImgAssets.center,
                  width: 1.sw,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Mai Al7elwa Center ',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary),
                ),
                // Positioned(
                //   right: 0,
                //   child: GestureDetector(
                //     onTap: () {
                //       setState(() {
                //         isOpen = !isOpen;
                //       });
                //     },
                //     child: Image.asset(
                //       isOpen ? ImgAssets.open : ImgAssets.close,
                //       height: 100.h,
                //       fit: BoxFit.fill,
                //     ),
                //   ),
                // ),
              ]),
              SizedBox(
                height: 20.h,
              ),
              MyCenterListItem(
                text: 'My Stock',
                onTap: () {
                  Navigator.pushNamed(context, Routes.myStock);
                },
              ),
              MyCenterListItem(
                text: 'Center Settings',
                onTap: () {
                  Navigator.pushNamed(context, Routes.centerSettings);
                },
              ),
              MyCenterListItem(
                text: 'My Account',
                onTap: () {
                  Navigator.pushNamed(context, Routes.myAccount);
                },
              ),
            ],
          ),
        ),
      );
    }));
  }
}

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  ProductListScreenState createState() => ProductListScreenState();
}

class ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Dismissible(
            key: const Key("products[index].name"),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {},
            background: Container(
              alignment: Alignment.centerRight,
              child: const Icon(Icons.edit, color: Colors.white),
            ),
            child: ListTile(
              title: const Text('aman'),
              subtitle: const Text('Quantity: 3'),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  _editQuantity(context, index);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _editQuantity(BuildContext context, int index) {
    TextEditingController controller = TextEditingController(text: '3');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Quantity'),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Quantity'),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                setState(() {
                  // products[index].quantity = int.parse(controller.text);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
