import 'package:gaslocator/features/registration/data/datasources/registration_remote_data_source.dart';
import 'package:gaslocator/features/registration/data/repositories/registration_repository_impl.dart';
import 'package:gaslocator/features/registration/domain/repositories/registration_repository.dart';
import 'package:gaslocator/features/registration/presentation/cubit/registration_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/api/api_consumer.dart';
import 'core/api/app_interceptors.dart';
import 'core/api/dio_consumer.dart';
import 'core/network/netwok_info.dart';
import 'features/random_quote/data/datasources/random_quote_local_data_source.dart';
import 'features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'features/random_quote/data/repositories/quote_repository_impl.dart';
import 'features/random_quote/domain/repositories/quote_repository.dart';
import 'features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'features/sitting/data/datasources/lang_local_data_source.dart';
import 'features/sitting/data/datasources/mode_local_data_source.dart';
import 'features/sitting/data/repositories/lang_repository_impl.dart';
import 'features/sitting/data/repositories/mode_repository_impl.dart';
import 'features/sitting/domain/repositories/lang_repository.dart';
import 'features/sitting/domain/repositories/mode_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Blocs
  sl.registerFactory<RandomQuoteCubit>(
      () => RandomQuoteCubit(getRandomQuoteUseCase: sl()));
  sl.registerFactory<RegistrationCubit>(() => RegistrationCubit(
        registrationRepository: sl(),
      ));

  // Use cases

  // sl.registerLazySingleton<PasswordUseCase>(
  //     () => PasswordUseCase(passwordRepository: sl()));

  // Repository
  sl.registerLazySingleton<QuoteRepository>(() => QuoteRepositoryImpl(
      networkInfo: sl(),
      randomQuoteRemoteDataSource: sl(),
      randomQuoteLocalDataSource: sl()));

  sl.registerLazySingleton<LangRepository>(
      () => LangRepositoryImpl(langLocalDataSource: sl()));
  sl.registerLazySingleton<ModeRepository>(
      () => ModeRepositoryImpl(modeLocalDataSource: sl()));
  sl.registerLazySingleton<RegistrationRepository>(
      () => RegistrationRepositoryImpl(registrationRemoteDataSource: sl()));
  // Data Sources

  sl.registerLazySingleton<RandomQuoteLocalDataSource>(
      () => RandomQuoteLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(
      () => RandomQuoteRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<LangLocalDataSource>(
      () => LangLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<ModeLocalDataSource>(
      () => ModeLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<RegistrationRemoteDataSource>(
      () => RegistrationRemoteDataSourceImpl());
  // Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
}
