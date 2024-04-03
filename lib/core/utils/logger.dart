import 'dart:developer';

import 'package:flutter/foundation.dart';

printLog(dynamic message, {String? tag}) {
  if (kDebugMode) {
    log('${tag != null ? 'HEI $tag' : 'HEI ${DateTime.now()}'}  :  $message');
  }
}

requestLogger(dynamic message, {String? tag, String? color}) {
  if (kDebugMode) {
    log('$color${tag != null ? 'HEI $tag' : 'HEI ${DateTime.now()}'}  :  $message');
  }
}
