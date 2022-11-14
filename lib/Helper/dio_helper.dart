import 'package:dio/dio.dart';

Dio DioHelper() {
  Dio dio = Dio();
  // dio.options.connectTimeout = 5000;

  dio.options.baseUrl = 'https://api.escuelajs.co/api/v1';
  return dio;
}
