part of 'mode_cubit.dart';

sealed class ModeState extends Equatable {
  const ModeState(this.mode);
  final String mode;
  @override
  List<Object> get props => [];
}

class InitialState extends ModeState {
  const InitialState(String selectedMode) : super(selectedMode);
}

class ChangeModeState extends ModeState {
  const ChangeModeState(String selectedMode) : super(selectedMode);
}

class State extends ModeState {
  const State(String selectedMode) : super(selectedMode);
}
