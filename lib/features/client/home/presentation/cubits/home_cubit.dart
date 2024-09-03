import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class ClientHomeCubit extends Cubit<ClientHomeState> {
  ClientHomeCubit()
      : super(
          const InitialState(),
        );

  // Future<void> getSavedMode() async {
  //   final response = await getSavedModeUseCase.call(NoParams());
  //   response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
  //     currentMode = value;
  //     emit(ChangeModeState(currentMode));
  //   });
  // }
}
