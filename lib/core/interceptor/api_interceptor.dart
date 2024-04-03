import 'dart:convert';
import 'package:dio/dio.dart';
import '../constants/log_color_constants.dart';

import '../utils/logger.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.putIfAbsent("Content-Type", () => 'application/json');
    options.headers.putIfAbsent("Accept", () => 'application/json');
    // options.headers.putIfAbsent("Agent", () => 'mobile');
    // await addLocale(options);
    onRequestLogger(options);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    requestLogger(
      "${LogColorConstant.white}${response.data}",
      tag:
          "Request | *StatusCode:${response.statusCode}* | *${response.statusMessage}* | Response Data",
      color: LogColorConstant.cyan,
    );
    requestLogger(
        "======================================================================================================================================================================================================================",
        color: LogColorConstant.green);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    requestLogger(
      "${LogColorConstant.red}${err.message}",
      tag:
          "${LogColorConstant.red}Request | *StatusCode:${err.response?.statusCode}* | Header",
      color: LogColorConstant.red,
    );
    super.onError(err, handler);
  }
}

// Future<void> addLocale(RequestOptions options) async {
//   var locale = await SharedPreferenceHelper.getString(
//       SharedPreferenceStringConstants.locale);
//   if (locale != null) {
//     LocaleModel model = LocaleModel.fromJson(jsonDecode(locale));
//     options.headers.putIfAbsent("Locale", () => model.languageCode);
//   } else {
//     options.headers.putIfAbsent("Locale", () => 'en');
//   }
// }

void onRequestLogger(RequestOptions options) {
  requestLogger(
    "${LogColorConstant.green}${options.headers}",
    tag: "Request | ${options.method} | Header",
    color: LogColorConstant.green,
  );
  if (options.data != null) {
    requestLogger(
      "${LogColorConstant.green}${options.data}",
      tag: "Request | ${options.method} | Payload",
      color: LogColorConstant.green,
    );
  }
  if (options.queryParameters.isNotEmpty) {
    requestLogger(
      "${LogColorConstant.green}${options.queryParameters}",
      tag: "Request | ${options.method} | Query Parameters",
      color: LogColorConstant.green,
    );
  }
  requestLogger(
    "${LogColorConstant.green}${options.uri}",
    tag: "Request | ${options.method} | Uri",
    color: LogColorConstant.green,
  );
  requestLogger(
    "${LogColorConstant.green}${options.path}",
    tag: "Request | ${options.method} | Path",
    color: LogColorConstant.green,
  );
  if (options.queryParameters.isNotEmpty) {
    requestLogger(
      "${LogColorConstant.green}${options.queryParameters}",
      tag: "Request | ${options.method} | Payload",
      color: LogColorConstant.green,
    );
  }
}
