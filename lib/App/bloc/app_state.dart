part of 'app_bloc.dart';

enum AppStatus { authenticated, unauthenticated }

class AppState extends Equatable {
  const AppState(
      {this.status = AppStatus.unauthenticated,
      // this.user,
      this.error,
      this.isOpen = false,
      this.isOwner = true,
      this.mode = ThemeMode.dark,
      this.locale = const Locale(AppStrings.englishCode)});

  final AppStatus status;
  //final AppUser? user;
  final String? error;
  final bool isOpen;
  final bool isOwner;
  final Locale locale;
  final ThemeMode mode;

  @override
  List<Object?> get props => [
        status, // user,
        isOpen, error, isOwner, locale, mode
      ];

  AppState copyWith({
    AppStatus? status,
    // AppUser? user,
    String? error,
    bool? isOpen,
    bool? isOwner,
    Locale? locale,
    ThemeMode? mode,
  }) {
    return AppState(
      status: status ?? this.status,
      //   user: user ?? this.user,
      error: error ?? this.error,
      isOpen: isOpen ?? this.isOpen,
      isOwner: isOwner ?? this.isOwner,
      locale: locale ?? this.locale,
      mode: mode ?? this.mode,
    );
  }
}

class AppInitial extends AppState {}
