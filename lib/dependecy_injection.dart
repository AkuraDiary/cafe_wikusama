import 'package:cafe_wikusama/data/sources/remote/menu_remote_data_source.dart';
import 'package:cafe_wikusama/data/sources/remote/table_remote_data_source.dart';
import 'package:cafe_wikusama/data/sources/remote/transaksi_remote_data_source.dart';
import 'package:cafe_wikusama/data/sources/repository/menu_repository_impl.dart';
import 'package:cafe_wikusama/data/sources/repository/table_repository_impl.dart';
import 'package:cafe_wikusama/data/sources/repository/transaksi_repository_impl.dart';
import 'package:cafe_wikusama/domain/repositories/menu_repository.dart';
import 'package:cafe_wikusama/domain/repositories/table_repository.dart';
import 'package:cafe_wikusama/domain/repositories/transaksi_repository.dart';
import 'package:cafe_wikusama/domain/usecase/auth/Login.dart';
import 'package:cafe_wikusama/domain/usecase/menu/AllMenu.dart';
import 'package:cafe_wikusama/domain/usecase/table/AllTable.dart';
import 'package:cafe_wikusama/domain/usecase/transaksi/AllTransaksi.dart';
import 'package:cafe_wikusama/presentation/notifier/auth/auth_notifier.dart';
import 'package:cafe_wikusama/presentation/notifier/menu/menu_notifier.dart';
import 'package:cafe_wikusama/presentation/notifier/table/table_notifier.dart';
import 'package:cafe_wikusama/presentation/notifier/transaksi/transaksi_notifier.dart';
import 'package:cafe_wikusama/presentation/pages/kasir/menu/menu.dart';
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

  //repository implementation section
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<MenuRepository>(
    () => MenuRepositoryImpl(
      menuRemoteDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<TransaksiRepository>(
    () => TransaksiRepositoryImpl(
      transaksiRemoteDataSource: locator(),
    ),
  );
    locator.registerLazySingleton<TableRepository>(
    () => TableRepositoryImpl(
      tableRemoteDataSource: locator(),
    ),
  );

  //usecase section
  locator.registerLazySingleton(() => Login(locator()));
  locator.registerLazySingleton(() => AllMenu(locator()));
  locator.registerLazySingleton(() => AllTransaksi(locator()));
  locator.registerLazySingleton(() => AllTable(locator()));


  //notifier section
  locator.registerFactory(() => AuthNotifier(loginCase: locator()));
  locator.registerFactory(() => MenuNotifier(allMenu: locator()));
  locator.registerFactory(() => TransaksiNotifier(allTransaksi: locator()));
  locator.registerFactory(() => TableNotifier(allTable: locator()));

  //data source section
  locator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  locator.registerLazySingleton<MenuRemoteDataSource>(
    () => MenuRemoteDataSourceImpl(),
  );
  locator.registerLazySingleton<TransaksiRemoteDataSource>(
    () => TransaksiRemoteDataSourceImpl(),
  );
  locator.registerLazySingleton<TableRemoteDataSource>(
    () => TableRemoteDataSourceImpl(),
  );
  locator.registerSingletonAsync<Dio>(() => DioClient().client());
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => Configs());
}
