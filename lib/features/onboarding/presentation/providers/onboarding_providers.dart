// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../../../dependency_injection/injector.dart';
// import '../../../../helper/shared_preference_helper.dart';

// final localProvider = StateProvider<Locale>((ref) {
//   final locale = getIt<SharedPreferencesHelper>().getString("locale");
//   if (locale != null) {
//     final localeData = json.decode(locale) as Map<String, dynamic>;
//     return Locale(localeData['languageCode'], localeData['countryCode']);
//   } else {
//     return const Locale('en', 'US');
//   }
// });
