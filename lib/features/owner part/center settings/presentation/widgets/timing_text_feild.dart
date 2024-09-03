import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaslocator/features/owner%20part/center%20settings/presentation/center%20settings%20cubit/center_settings_cubit.dart';

class TimingTextFeild extends StatelessWidget {
  final TextEditingController _timeController = TextEditingController();

  TimingTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CenterSettingsCubit, CenterSettingsState>(
      listener: (context, state) {
        if (state.selectedTime != null) {
          _timeController.text = state.selectedTime!;
        }
      },
      child: BlocBuilder<CenterSettingsCubit, CenterSettingsState>(
        builder: (context, state) {
          return TextFormField(
            controller: _timeController,
            readOnly: true,
            decoration: const InputDecoration(
              hintText: 'Select time',
              suffixIcon: Icon(Icons.access_time),
            ),
            onTap: () => context.read<CenterSettingsCubit>().pickTime(context),
          );
        },
      ),
    );
  }
}
