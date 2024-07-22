import 'package:dartz/dartz.dart';
import 'package:gaslocator/features/registration/domain/entities/request/user_registration_request.dart';
import '../../../../core/error/failures.dart';

abstract class RegistrationRepository {
  Future<Either<Failure, bool>> login(
      {required String email, required String password});
  Future<Either<Failure, bool>> signup(
      {required String password,
      required String email,
      required UserRegistrationRequest user});
  Future<Either<Failure, bool>> resetPassword({required String email});
}
