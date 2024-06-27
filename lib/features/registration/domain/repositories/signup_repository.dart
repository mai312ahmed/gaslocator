import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

abstract class SignupRepository {
  Future<Either<Failure, bool>> signup(
      {required String email, required String passsword});
}
