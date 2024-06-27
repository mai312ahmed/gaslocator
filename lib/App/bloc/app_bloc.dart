import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gaslocator/core/utils/app_strings.dart';
import 'package:gaslocator/features/sitting/domain/repositories/lang_repository.dart';
//import 'package:waseet/features/user/domain/entities/about_us_model.dart';
// import 'package:waseet/features/user/domain/entities/wasset_user.dart';
// import 'package:waseet/features/user/domain/repositories/authentication_repository.dart';
//import 'package:waseet/res/shared_preferences.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required LangRepository langRepository,
  })  : _langRepository = langRepository,
        // _authenticationRepository = authenticationRepository,
        super(AppInitial()) {
    on<AppEvent>((event, emit) {});
    on<AppStarted>(_appStarted);
    on<AppLoggedIn>((event, emit) {});
    on<AppLoggedOut>(_appLoggedOut);
    on<ChangeLocalToEnglish>(toEnglish);
    on<ChangeLocalToArabic>(toArabic);
    on<ChangeMode>((event, emit) {});
    on<ChangeAccountStateEvent>(_changeAccountState);
    add(AppStarted());
  }
  final LangRepository _langRepository;

  //final ChangeLangUseCase changeLangUseCase;
  // final GetSavedModeUseCase getSavedModeUseCase;
  // final ChangeModeUseCase changeModeUseCase;
  // final AuthenticationRepository _authenticationRepository;

  FutureOr<void> _appStarted(AppStarted event, Emitter<AppState> emit) async {
    final response = await _langRepository.getSavedLang();
    response
        .fold((failure) => emit(state.copyWith(error: failure.errorMessages)),
            (value) {
      emit(state.copyWith(locale: Locale(value)));
    });
    // final token = WaseetSharedPreferences.getToken();

    // try {
    //   if (token != null && token.isNotEmpty) {
    //     final user = await _authenticationRepository.getUser();
    //     emit(state.copyWith(user: user.data, status: AppStatus.authenticated));
    //   } else {
    //     emit(state.copyWith(status: AppStatus.unauthenticated));
    //   }
    // } on Exception catch (e) {
    //   emit(
    //     state.copyWith(
    //       error: e.toString(),
    //       status: AppStatus.unauthenticated,
    //     ),
    //   );
    //   await WaseetSharedPreferences.setToken('');
    // }
  }

  FutureOr<void> _appLoggedOut(
    AppLoggedOut event,
    Emitter<AppState> emit,
  ) async {
    //   unawaited(_authenticationRepository.signOut());
    add(AppStarted());
  }

  bool get isAuthenticated => state.status == AppStatus.authenticated;

  FutureOr<void> _changeAccountState(
    ChangeAccountStateEvent event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(isOpen: !state.isOpen));
  }

  Future<void> getSavedLangCode(Emitter<AppState> emit) async {
    final response = await _langRepository.getSavedLang();
    response
        .fold((failure) => emit(state.copyWith(error: failure.errorMessages)),
            (value) {
      emit(state.copyWith(locale: Locale(value)));
    });
  }

  Future<void> toEnglish(
      ChangeLocalToEnglish event, Emitter<AppState> emit) async {
    final response =
        await _langRepository.changeLang(langCode: AppStrings.englishCode);
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      emit(state.copyWith(locale: const Locale(AppStrings.englishCode)));
    });
  }

  Future<void> toArabic(
      ChangeLocalToArabic event, Emitter<AppState> emit) async {
    final response =
        await _langRepository.changeLang(langCode: AppStrings.arabicCode);
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      emit(state.copyWith(locale: const Locale(AppStrings.arabicCode)));
    });
  }
}
