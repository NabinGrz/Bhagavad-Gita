import 'package:bhagvadgita/core/constants/string_constants.dart';
import 'package:bhagvadgita/core/request/request_client.dart';
import 'package:dio/dio.dart';

import '../interceptor/api_interceptor.dart';

class RequestClientImpl extends RequestClient {
  late Dio dio;
  int refreshTokenStatusCode = 0;
  BaseOptions options = BaseOptions(
      baseUrl: AppString.rapidApiHosts,
      headers: {'X-Rapidapi-Key': AppString.rapidApiKey},
      connectTimeout: const Duration(seconds: 120),
      receiveTimeout: const Duration(seconds: 120));
  RequestClientImpl() {
    dio = Dio(options);
    addInterceptor();
  }

  @override
  Future<Response?> get(
      {required String endPoint,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParameters}) async {
    return await dio.get(endPoint,
        options: Options(
          headers: headers,
        ),
        queryParameters: queryParameters);
  }

  @override
  void addInterceptor() {
    dio.interceptors.add(ApiInterceptor());
  }
}
