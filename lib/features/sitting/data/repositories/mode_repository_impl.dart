import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/mode_repository.dart';
import '../datasources/mode_local_data_source.dart';

class ModeRepositoryImpl implements ModeRepository {
  final ModeLocalDataSource modeLocalDataSource;
  ModeRepositoryImpl({
    required this.modeLocalDataSource,
  });
  @override
  Future<Either<Failure, bool>> changeMode({required String mode}) async {
    try {
      final modeIsChanged = await modeLocalDataSource.changeMode(mode: mode);
      return Right(modeIsChanged);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getSavedMode() async {
    try {
      final mode = await modeLocalDataSource.getSavedMode();
      return Right(mode);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
