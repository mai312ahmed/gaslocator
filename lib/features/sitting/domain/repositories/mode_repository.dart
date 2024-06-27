import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class ModeRepository {
  Future<Either<Failure, bool>> changeMode({required String mode});
  Future<Either<Failure, String>> getSavedMode();
}
