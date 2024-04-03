import 'package:bhagvadgita/core/localization/app_localization.dart';
import 'package:flutter/material.dart';

extension StringLocalizationExtension on String {
  String localize(BuildContext context) {
    return AppLocalization.of(context).getTranslatedValue(this) ?? "*@*($this)";
  }
}
