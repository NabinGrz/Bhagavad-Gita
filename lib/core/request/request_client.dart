import 'package:dio/dio.dart';

abstract class RequestClient {
  Future<Response?> get({
    required String endPoint,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  });

  void addInterceptor();
}
