
import 'package:bhagvadgita/core/utils/locale.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final languageProvider = StateProvider<Locale>((ref) {
  return getLocale();
});
final mainlocaleProvider = StateProvider<Locale>((ref) {
  return getLocale();
});
