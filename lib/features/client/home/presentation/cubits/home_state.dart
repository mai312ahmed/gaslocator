part of 'home_cubit.dart';

sealed class ClientHomeState extends Equatable {
  const ClientHomeState();

  @override
  List<Object> get props => [];
}

class InitialState extends ClientHomeState {
  const InitialState() : super();
}
