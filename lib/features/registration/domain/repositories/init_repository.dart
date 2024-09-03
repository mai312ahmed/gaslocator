import 'package:dartz/dartz.dart';
import 'package:gaslocator/features/registration/domain/entities/request/user_update_request.dart';
import 'package:gaslocator/features/settings/domain/entities/user_entity.dart';

import '../../../../core/error/failures.dart';

abstract class InitRepository {
  Future<Either<Failure, bool>> updateUserInfo(
      {required UserUpdateRequest user});
  Future<Either<Failure, UserEntity?>> getSavedUserInfo();
}
