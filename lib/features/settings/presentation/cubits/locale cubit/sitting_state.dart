part of 'sitting_cubit.dart';

sealed class LocaleState extends Equatable {
  const LocaleState(this.locale);
  final Locale locale;
  @override
  List<Object> get props => [];
}

class InitialState extends LocaleState {
  const InitialState(Locale selectedLocale) : super(selectedLocale);
}

class ChangeLocalState extends LocaleState {
  const ChangeLocalState(Locale selectedLocale) : super(selectedLocale);
}

class State extends LocaleState {
  const State(Locale selectedLocale) : super(selectedLocale);
}
