import 'package:gaslocator/features/client/home/presentation/cubits/home_cubit.dart';
import 'package:gaslocator/features/owner%20part/center%20settings/presentation/center%20settings%20cubit/center_settings_cubit.dart';
import 'package:gaslocator/features/owner%20part/direct%20sale/presentation/cubit/direct_sale_cubit.dart';
import 'package:gaslocator/features/owner%20part/manage%20bookings/presentation/cubit/manage_booking_cubit.dart';
import 'package:gaslocator/features/owner%20part/my%20account/presentation/my%20acoubt%20cubit/myaccount_cubit.dart';
import 'package:gaslocator/features/owner%20part/my%20center/presentation/cubit/my_center_cubit.dart';
import 'package:gaslocator/features/registration/data/datasources/init_remote_data_source.dart';
import 'package:gaslocator/features/registration/data/datasources/registration_remote_data_source.dart';
import 'package:gaslocator/features/registration/data/repositories/init_repository_impl.dart';
import 'package:gaslocator/features/registration/data/repositories/registration_repository_impl.dart';
import 'package:gaslocator/features/registration/domain/repositories/init_repository.dart';
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
import 'features/settings/data/datasources/lang_local_data_source.dart';
import 'features/settings/data/datasources/mode_local_data_source.dart';
import 'features/settings/data/repositories/lang_repository_impl.dart';
import 'features/settings/data/repositories/mode_repository_impl.dart';
import 'features/settings/domain/repositories/lang_repository.dart';
import 'features/settings/domain/repositories/mode_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Blocs

  sl.registerFactory<RegistrationCubit>(() => RegistrationCubit(
        registrationRepository: sl(),
        initRepository: sl(),
      ));
  sl.registerFactory<MyCenterCubit>(() => MyCenterCubit());
  sl.registerFactory<MyAccountCubit>(() => MyAccountCubit());
  sl.registerFactory<ManageBookingCubit>(() => ManageBookingCubit());
  sl.registerFactory<ClientHomeCubit>(() => ClientHomeCubit());
  sl.registerFactory<CenterSettingsCubit>(() => CenterSettingsCubit());
  sl.registerFactory<DirectSaleCubit>(() => DirectSaleCubit());

  // Use cases

  // sl.registerLazySingleton<PasswordUseCase>(
  //     () => PasswordUseCase(passwordRepository: sl()));

  // Repository

  sl.registerLazySingleton<LangRepository>(
      () => LangRepositoryImpl(langLocalDataSource: sl()));
  sl.registerLazySingleton<ModeRepository>(
      () => ModeRepositoryImpl(modeLocalDataSource: sl()));
  sl.registerLazySingleton<RegistrationRepository>(
      () => RegistrationRepositoryImpl(registrationRemoteDataSource: sl()));
  sl.registerLazySingleton<InitRepository>(
      () => InitRepositoryImpl(initRemoteDataSource: sl()));
  // Data Sources

  sl.registerLazySingleton<LangLocalDataSource>(
      () => LangLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<ModeLocalDataSource>(
      () => ModeLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<RegistrationRemoteDataSource>(
      () => RegistrationRemoteDataSourceImpl());
  sl.registerLazySingleton<InitRemoteDataSource>(
      () => InitRemoteDataSourceImpl());
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
