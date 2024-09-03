import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../repositories/mode_repository.dart';

class GetSavedModeUseCase implements UseCase<String, NoParams> {
  final ModeRepository modeRepository;
  GetSavedModeUseCase({
    required this.modeRepository,
  });
  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return modeRepository.getSavedMode();
  }
}
