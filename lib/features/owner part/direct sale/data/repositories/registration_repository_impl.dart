import 'package:gaslocator/features/registration/data/datasources/registration_remote_data_source.dart';
import 'package:gaslocator/features/registration/domain/entities/request/user_registration_request.dart';
import 'package:gaslocator/features/registration/domain/repositories/registration_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/error/failures.dart';

class RegistrationRepositoryImpl implements RegistrationRepository {
//final NetworkInfo networkInfo;
  final RegistrationRemoteDataSource registrationRemoteDataSource;
  RegistrationRepositoryImpl({
    required this.registrationRemoteDataSource,
    // required this.networkInfo,
  });

  @override
  Future<Either<Failure, bool>> login(
      {required String email, required String password}) async {
    try {
      return Right(await registrationRemoteDataSource.login(
          password: password, email: email));
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

  @override
  Future<Either<Failure, bool>> signup(
      {required String password,
      required String email,
      required UserRegistrationRequest user}) async {
    try {
      return right(await registrationRemoteDataSource.signup(
          email: email, password: password, user: user));
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
