import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaslocator/features/registration/domain/entities/request/user_registration_request.dart';
import 'package:gaslocator/features/registration/domain/repositories/init_repository.dart';
import 'package:gaslocator/features/registration/domain/repositories/registration_repository.dart';
import 'package:gaslocator/features/settings/domain/entities/user_entity.dart';
import '../../../../core/error/failures.dart';
part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final RegistrationRepository _registrationRepository;
  final InitRepository _initRepository;
  RegistrationCubit(
      {required RegistrationRepository registrationRepository,
      required InitRepository initRepository})
      : _registrationRepository = registrationRepository,
        _initRepository = initRepository,
        super(const RegistrationInitial());

  FutureOr<void> loginWithEmail() async {
    emit(state.copyWith(status: RegistrationStatus.inProgress));
    Either<Failure, bool> response = await _registrationRepository.login(
        email: state.email!, password: state.password!);
    response.fold(
        (failure) => emit(state.copyWith(
            status: RegistrationStatus.failure,
            errorMessage: failure.errorMessages)), (value) async {
      if (value == true) {
        final user = await _initRepository.getSavedUserInfo();
        user.fold(
            (failure) => emit(state.copyWith(
                status: RegistrationStatus.failure,
                errorMessage: "Failed to fetch data")), (user) {
          emit(state.copyWith(status: RegistrationStatus.success, user: user));
        });
      } else {
        emit(state.copyWith(
            status: RegistrationStatus.failure,
            errorMessage:
                'your email is not active we will send the verify code again please check your email'));
      }
    });
  }

  FutureOr<void> signupWithEmail() async {
    emit(state.copyWith(status: RegistrationStatus.inProgress));
    Either<Failure, bool> response = await _registrationRepository.signup(
        email: state.email!,
        password: state.password!,
        user: UserRegistrationRequest(
          name: state.userName!,
          email: state.email!,
          isClient: state.isClient,
        ));
    response.fold(
        (failure) => emit(state.copyWith(
            status: RegistrationStatus.failure,
            errorMessage: failure.errorMessages)), (value) {
      emit(state.copyWith(status: RegistrationStatus.success));
    });
  }

  void emailChanged(String value) {
    emit(
      state.copyWith(email: value, status: RegistrationStatus.initial),
    );
  }

  void passwordChanged(String value) {
    final password = value;
    emit(
      state.copyWith(password: password, status: RegistrationStatus.initial),
    );
  }

  void userNameChanged(String value) {
    final userName = value;
    emit(
      state.copyWith(userName: userName, status: RegistrationStatus.initial),
    );
  }

  void confasswordChanged(String value) {
    final confPassword = value;
    emit(
      state.copyWith(
          confPassword: confPassword, status: RegistrationStatus.initial),
    );
  }

  void setType({required bool isClient}) {
    emit(
      state.copyWith(
        isClient: isClient,
      ),
    );
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegex.hasMatch(email);
  }

  bool _isValidPassword(String pw) {
    final passlRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    return passlRegex.hasMatch(pw);
  }

  String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (!_isValidEmail(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (!_isValidPassword(value)) {
      return 'The password must contain at least one letter,one digit, and have a minimum length of 8 characters';
    }
    return null;
  }

  String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (value.length < 3) {
      return 'Use name too short';
    }
    return null;
  }

  String? passwordMatchingValidation(String? value) {
    if (state.password != state.confPassword) {
      return 'The password does not match';
    }
    return null;
  }

  resetPasssword() {}
}
