import 'package:dio/dio.dart';
import '../constants/app_constants.dart';

class ApiService {
  static late Dio _dio;

  static void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.aladhanApiBaseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Accept': 'application/json',
        },
      ),
    );

    // Logging interceptor in debug mode
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: false,
      responseHeader: false,
      responseBody: true,
      error: true,
    ));
  }

  static Dio get client {
    // Lazy init just in case
    try {
      return _dio;
    } catch (_) {
      init();
      return _dio;
    }
  }
}
