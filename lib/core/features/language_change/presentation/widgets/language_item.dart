import 'dart:convert';

import 'package:bhagvadgita/core/extensions/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../dependency_injection/injector.dart';
import '../../../../helper/shared_preference_helper.dart';
import '../../../../shared/widgets/build_text.dart';
import '../providers/language_provider.dart';

class LanguageItem extends ConsumerWidget {
  final bool isSelected;
  final String language;
  final Locale locale;
  const LanguageItem(
      {super.key,
      required this.isSelected,
      required this.language,
      required this.locale});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(languageProvider.notifier);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () async {
            Map<String, String> localeMap = {
              'languageCode': locale.languageCode,
              'countryCode': locale.countryCode ?? ""
            };
            await getIt<SharedPreferencesHelper>()
                .setString("locale", json.encode(localeMap));
            notifier.update((state) =>
                Locale(locale.languageCode, locale.countryCode ?? ""));
          },
          child: Container(
            padding: const EdgeInsets.all(2),
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? const Color(0xffFF8600) : Colors.black,
                width: 1.5,
              ),
            ),
            child: isSelected
                ? Container(
                    decoration: const BoxDecoration(
                        color: Color(0xffFF8600), shape: BoxShape.circle),
                  )
                : const SizedBox.shrink(),
          ),
        ),
        20.width,
        BuildText(
          text: language,
          fontSize: 16.sp,
          weight: FontWeight.w600,
        )
      ],
    );
  }
}
