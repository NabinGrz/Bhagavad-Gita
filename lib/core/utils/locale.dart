import 'dart:convert';

import 'package:flutter/material.dart';

import '../dependency_injection/injector.dart';
import '../helper/shared_preference_helper.dart';

Locale getLocale() {
  final locale = getIt<SharedPreferencesHelper>().getString("locale");
  if (locale != null) {
    final localeData = json.decode(locale) as Map<String, dynamic>;
    return Locale(localeData['languageCode'], localeData['countryCode']);
  } else {
    return const Locale('en', 'US');
  }
}
