import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/error/failures.dart';
import '../../domain/repositories/reset_password_repository.dart';

class PasswordRepositoryImpl implements PasswordRepository {
  PasswordRepositoryImpl();

  @override
  Future<Either<Failure, bool>> resetPassword({required String email}) async {
    try {
      return const Right(true);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      if (e is FirebaseAuthException) {
        return left(ServerFailure.fromFirebaseAuthException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
