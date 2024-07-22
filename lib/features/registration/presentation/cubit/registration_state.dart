part of 'registration_cubit.dart';

enum RegistrationStatus { success, failure, inProgress, initial }

class RegistrationState extends Equatable {
  const RegistrationState({
    this.errorMessage = '',
    this.email,
    this.password,
    this.userName,
    this.confPassword,
    this.isFormValid = false,
    this.isClient = true,
    this.status = RegistrationStatus.initial,
  });

  final String errorMessage;
  final String? email;
  final String? userName;
  final String? password;
  final String? confPassword;
  final bool isFormValid;
  final bool isClient;
  final RegistrationStatus status;

  @override
  List<Object?> get props => [
        errorMessage,
        email,
        password,
        isFormValid,
        userName,
        status,
        confPassword,
        isClient,
      ];

  RegistrationState copyWith({
    String? errorMessage,
    String? email,
    String? userName,
    String? password,
    String? confPassword,
    bool? isFormValid,
    bool? isClient,
    RegistrationStatus? status,
  }) {
    return RegistrationState(
      errorMessage: errorMessage ?? this.errorMessage,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      confPassword: confPassword ?? this.confPassword,
      isFormValid: isFormValid ?? this.isFormValid,
      isClient: isClient ?? this.isClient,
      status: status ?? this.status,
    );
  }
}

class RegistrationInitial extends RegistrationState {
  const RegistrationInitial() : super();
}
