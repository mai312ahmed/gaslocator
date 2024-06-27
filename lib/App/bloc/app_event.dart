part of 'app_bloc.dart';

class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AppEvent {}

class AppLoggedIn extends AppEvent {
  // const AppLoggedIn(this.user);

  // final AppUser user;

  @override
  List<Object> get props => [
        //user
      ];
}

class AppLoggedOut extends AppEvent {}

class ChangeAccountStateEvent extends AppEvent {}

class ChangeMode extends AppEvent {}

class ChangeLocalToArabic extends AppEvent {}

class ChangeLocalToEnglish extends AppEvent {}
