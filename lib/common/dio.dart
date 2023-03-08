import 'package:cafe_wikusama/common/app_config.dart';
import 'package:cafe_wikusama/common/app_shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';
import '../dependecy_injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient {
  DioClient();
  Future<Dio> client() async {
    // final userAgent = await FkUserAgent().get
    await locator.isReady<SharedPreferences>();
    final token = locator.get<AppSharedPreferences>().getToken();
    print('token: $token');
    var options = BaseOptions(
      baseUrl: Configs.baseUrlDev,
      //baseUrl: flavor == 'dev' ? Configs.baseUrlDev : Configs.baseUrlProd, //TODO add prod env
      followRedirects: false,
      sendTimeout: 0,
      connectTimeout: 0,
      receiveTimeout: 0,
      // will not throw errors
      validateStatus: (status) => true,

      headers: {
        "Authorization": 'Bearer $token',
        // 'User-Agent': userAgent,
        'Accept': 'application/json',
      },
      contentType: 'multipart/form-data',
    );
    Dio dio = Dio(options);
    dio.interceptors.add(dioLoggerInterceptor);
    return dio;
  }
}
