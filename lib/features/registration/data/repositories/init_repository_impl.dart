import 'package:dartz/dartz.dart';
import 'package:gaslocator/features/registration/data/datasources/init_remote_data_source.dart';
import 'package:gaslocator/features/registration/domain/entities/request/user_update_request.dart';
import 'package:gaslocator/features/registration/domain/repositories/init_repository.dart';
import 'package:gaslocator/features/settings/domain/entities/user_entity.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';

class InitRepositoryImpl implements InitRepository {
  final InitRemoteDataSource initRemoteDataSource;
  InitRepositoryImpl({
    required this.initRemoteDataSource,
  });
  @override
  Future<Either<Failure, bool>> updateUserInfo(
      {required UserUpdateRequest user}) async {
    try {
      final success = await initRemoteDataSource.updateUserInfo(user: user);
      return Right(success);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getSavedUserInfo() async {
    try {
      final userIinfo = await initRemoteDataSource.getSavedUserInfo();
      if (userIinfo != null) {
        return Right(userIinfo);
      }
      return left(const CacheFailure(''));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
