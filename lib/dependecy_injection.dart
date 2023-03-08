
import 'package:cafe_wikusama/domain/usecase/auth/Login.dart';
import 'package:cafe_wikusama/presentation/notifier/auth/auth_notifier.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'common/dio.dart';
import 'common/app_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common/app_shared_preferences.dart';
import 'data/sources/remote/auth_remote_data_source.dart';
import 'data/sources/repository/auth_repository_impl.dart';
import 'domain/repositories/auth_repository.dart';

final locator = GetIt.instance;

void init() {
  locator.allowReassignment = true;

  locator.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  locator.registerLazySingleton<AppSharedPreferences>(
      () => AppSharedPreferences(preferences: locator()));

  // use case section
  locator.registerLazySingleton(
      () => Login(locator()));

  locator.registerSingletonAsync<Dio>(() => DioClient().client());
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => Configs());

  //repository implementation section
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSource: locator(),
    ),
  );

  //notifier section
  locator.registerFactory(() => AuthNotifier(loginCase: locator()));

  //data source section
  locator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
}
