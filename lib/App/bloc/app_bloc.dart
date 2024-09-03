import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gaslocator/core/utils/app_strings.dart';
import 'package:gaslocator/features/registration/domain/repositories/init_repository.dart';
import 'package:gaslocator/features/settings/domain/entities/user_entity.dart';
import 'package:gaslocator/features/settings/domain/repositories/lang_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(
      {required LangRepository langRepository,
      required InitRepository initRepository})
      : _langRepository = langRepository,
        _initRepository = initRepository,
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
  final InitRepository _initRepository;

  FutureOr<void> _appStarted(AppStarted event, Emitter<AppState> emit) async {
    final response = await _langRepository.getSavedLang();
    response
        .fold((failure) => emit(state.copyWith(error: failure.errorMessages)),
            (value) {
      emit(state.copyWith(locale: Locale(value)));
    });

    final user = await _initRepository.getSavedUserInfo();
    user.fold(
        (failure) => emit(state.copyWith(
            status: AppStatus.unauthenticated,
            error: "Failed to fetch data")), (user) {
      emit(state.copyWith(
          user: user,
          status: user!.isAuth
              ? AppStatus.authenticated
              : AppStatus.authenticated));
    });

    FlutterNativeSplash.remove();
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
