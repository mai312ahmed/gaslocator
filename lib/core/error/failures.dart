import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure extends Equatable {
  final String errorMessages;
  const Failure(this.errorMessages);
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure(super.errorMessages);
  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ServerFailure("Error During Communication");
      case DioExceptionType.badCertificate:
        break;
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return const ServerFailure("Request to ApiServer was canceled");
      case DioExceptionType.connectionError:
        return const ServerFailure("Connection error");
      case DioExceptionType.unknown:
        {
          if (dioException.message!.contains("SocketException")) {
            return const ServerFailure("No internet connection ");
          }
          return const ServerFailure("Un expected error, please try again");
        }
    }
    return const ServerFailure(
        "Opps there was an error, please try again later");
  }

  factory ServerFailure.fromResponse(int stateCod, dynamic response) {
    if (stateCod == 400 || stateCod == 401 || stateCod == 403) {
      return ServerFailure(response["error"]["message"]);
    } else if (stateCod == 404) {
      return const ServerFailure(
          "Your request not found, please try again later");
    } else if (stateCod >= 500) {
      return const ServerFailure(
          "Internal Server error, please try again later");
    } else {
      return const ServerFailure(
          "Opps there was an error, please try again later");
    }
  }

  factory ServerFailure.fromFirebaseAuthException(
      FirebaseAuthException firebaseAuthException) {
    switch (firebaseAuthException.code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return const ServerFailure(
            "There is an error in the email or password");
      case 'invalid-email':
        return const ServerFailure("Invalid email");
      case 'user-disabled':
        return const ServerFailure("User disabled");
      case 'user-not-found':
        return const ServerFailure("User not found");
      case 'email-already-in-use':
        return const ServerFailure(
            "The email address is already in use by another account");
      case 'operation-not-allowed':
        return const ServerFailure("Operation not allowed");
      case 'weak-password':
        return const ServerFailure("Weak password");
      case 'account-exists-with-different-credential':
        return const ServerFailure("Account exists with different credential");
      case 'invalid-credential':
        return const ServerFailure("Invalid credential kkkkkkkkkkk");
      case 'invalid-verification-code':
        return const ServerFailure("Invalid verification code");
      case 'invalid-verification-id':
        return const ServerFailure("Invalid verification id");
      case 'user-mismatch':
        return const ServerFailure("User mismatch");
    }
    return ServerFailure(firebaseAuthException.code);
    //"Opps there was an error, please try again");
  }
}

class CacheFailure extends Failure {
  const CacheFailure(super.errorMessages);
}
