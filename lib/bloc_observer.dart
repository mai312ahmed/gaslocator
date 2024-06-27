import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('onCreate(${bloc.runtimeType})');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log('onEvent(${bloc.runtimeType},$event)');
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log('onChange(${bloc.runtimeType},$change)');
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log('onTransition(${bloc.runtimeType},$transition)');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('onClose(${bloc.runtimeType},');
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  await runZonedGuarded(
    () async => runApp(await builder()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
