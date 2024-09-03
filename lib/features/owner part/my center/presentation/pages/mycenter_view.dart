import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaslocator/features/owner%20part/my%20center/presentation/cubit/my_center_cubit.dart';
import '../widgets/mycenter_view_body.dart';
import "package:gaslocator/injection_container.dart" as di;

class MyCenterView extends StatelessWidget {
  const MyCenterView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => di.sl<MyCenterCubit>(),
        child: const Scaffold(
          backgroundColor: Colors.white,
          body: MyCenterViewBody(),
        ));
  }
}
