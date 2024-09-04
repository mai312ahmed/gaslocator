import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';

abstract class PasswordRepository {
  Future<Either<Failure, bool>> resetPassword({required String email});
}
