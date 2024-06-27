import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaslocator/features/sitting/domain/usecases/change_mode.dart';
import 'package:gaslocator/features/sitting/domain/usecases/get_saved_mode.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../../../core/utils/app_strings.dart';

part 'mode_state.dart';

class ModeCubit extends Cubit<ModeState> {
  final GetSavedModeUseCase getSavedModeUseCase;
  final ChangeModeUseCase changeModeUseCase;

  ModeCubit({
    required this.getSavedModeUseCase,
    required this.changeModeUseCase,
  }) : super(
          const InitialState(AppStrings.darkMode),
        );

  String currentMode = AppStrings.darkMode;

  Future<void> getSavedMode() async {
    final response = await getSavedModeUseCase.call(NoParams());
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentMode = value;
      emit(ChangeModeState(currentMode));
    });
  }

  Future<void> _changeMode(String mode) async {
    final response = await changeModeUseCase.call(mode);
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentMode = mode;
      emit(ChangeModeState(currentMode));
    });
  }

  void toDark() => _changeMode(AppStrings.darkMode);
  void toLight() => _changeMode(AppStrings.lightMode);
}
