import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

abstract class RegistrationRepository {
  Future<Either<Failure, bool>> login(
      {required String email, required String password});
  Future<Either<Failure, bool>> signup(
      {required String email, required String password});
  Future<Either<Failure, bool>> resetPassword({required String email});
}
