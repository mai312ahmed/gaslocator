import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaslocator/core/utils/app_colors.dart';

part 'center_settings.dart';

class CenterSettingsCubit extends Cubit<CenterSettingsState> {
  CenterSettingsCubit()
      : super(
          const CenterSettingsInitial(),
        );
  Future<void> pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      final String formattedTime = picked.format(context);
      emit(state.copyWith(selectedTime: formattedTime));
    }
  }
}
