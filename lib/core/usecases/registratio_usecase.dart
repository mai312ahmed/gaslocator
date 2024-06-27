import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../error/failures.dart';

abstract class RegistrationUseCase<Type, Param> {
  Future<Either<Failure, Type>> call(String email, String password);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
