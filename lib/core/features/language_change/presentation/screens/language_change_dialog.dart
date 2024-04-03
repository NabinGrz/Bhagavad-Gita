import 'package:bhagvadgita/core/extensions/num_extension.dart';
import 'package:bhagvadgita/core/features/language_change/presentation/providers/language_provider.dart';
import 'package:bhagvadgita/core/features/language_change/presentation/widgets/language_item.dart';
import 'package:bhagvadgita/core/shared/widgets/build_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChangeLanguageDialog extends ConsumerWidget {
  const ChangeLanguageDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      content: Container(
        decoration: BoxDecoration(
          color: const Color(0xffF9D9B5),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/language.png",
              height: 100.w,
            ),
            12.height,
            BuildText(
              text: "Choose your preferred\nlanguage",
              fontSize: 16.sp,
              weight: FontWeight.w600,
              textAlign: TextAlign.center,
            ),
            4.height,
            BuildText(
              text: "(Don’t worry you can change it later)",
              fontSize: 12.sp,
            ),
            16.height,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LanguageItem(
                  language: "English",
                  locale: const Locale('en', 'US'),
                  isSelected: ref.watch(languageProvider).languageCode == "en",
                ),
                12.height,
                LanguageItem(
                  language: "Hindi",
                  locale: const Locale('hi', 'IN'),
                  isSelected: ref.watch(languageProvider).languageCode == "hi",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
