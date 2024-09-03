import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaslocator/features/settings/domain/usecases/change_mode.dart';
import 'package:gaslocator/features/settings/domain/usecases/get_saved_mode.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../domain/usecases/change_lang.dart';
import '../../../domain/usecases/get_saved_lang.dart';

part 'sitting_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final GetSavedLangUseCase getSavedLangUseCase;
  final ChangeLangUseCase changeLangUseCase;
  final GetSavedModeUseCase getSavedModeUseCase;
  final ChangeModeUseCase changeModeUseCase;

  LocaleCubit(
      {required this.getSavedModeUseCase,
      required this.changeModeUseCase,
      required this.getSavedLangUseCase,
      required this.changeLangUseCase})
      : super(
          const InitialState(Locale(AppStrings.englishCode)),
        );
  String currentLangCode = AppStrings.englishCode;
  String currentMode = AppStrings.darkMode;
  Future<void> getSavedLangCode() async {
    final response = await getSavedLangUseCase.call(NoParams());
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLangCode = value;
      emit(ChangeLocalState(Locale(currentLangCode)));
    });
  }

  Future<void> _changeLangCode(String langCode) async {
    emit(State(Locale(currentLangCode)));
    final response = await changeLangUseCase.call(langCode);
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLangCode = langCode;
      emit(ChangeLocalState(Locale(currentLangCode)));
    });
  }

  void toEnglish() => _changeLangCode(AppStrings.englishCode);
  void toArabic() => _changeLangCode(AppStrings.arabicCode);

  Future<void> getSavedMode() async {
    emit(State(Locale(currentLangCode)));
    final response = await getSavedModeUseCase.call(NoParams());
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentMode = value;
      // emit(ChangeModeState(currentMode));
    });
  }

  Future<void> _changeMode(String mode) async {
    final response = await changeModeUseCase.call(mode);
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentMode = mode;
      //   emit(ChangeModeState(currentMode));
    });
  }

  void toDark() => _changeMode(AppStrings.darkMode);
  void toLight() => _changeMode(AppStrings.lightMode);
}
