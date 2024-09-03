import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../repositories/mode_repository.dart';

class ChangeModeUseCase implements UseCase<bool, String> {
  final ModeRepository modeRepository;
  ChangeModeUseCase({
    required this.modeRepository,
  });
  @override
  Future<Either<Failure, bool>> call(String mode) async =>
      await modeRepository.changeMode(mode: mode);
}
