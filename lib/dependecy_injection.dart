import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'common/dio.dart';
import 'common/app_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common/app_shared_preferences.dart';

final locator = GetIt.instance;

void init() {
  locator.allowReassignment = true;

  locator.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  locator.registerLazySingleton<AppSharedPreferences>(
      () => AppSharedPreferences(preferences: locator()));

  locator.registerSingletonAsync<Dio>(() => DioClient().client());
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => Configs());
}
