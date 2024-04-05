import 'dart:convert';

import 'package:bhagvadgita/core/extensions/num_extension.dart';
import 'package:bhagvadgita/features/language_change/presentation/providers/language_provider.dart';
import 'package:bhagvadgita/features/language_change/presentation/widgets/language_item.dart';
import 'package:bhagvadgita/core/shared/widgets/build_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/dependency_injection/injector.dart';
import '../../../../core/helper/shared_preference_helper.dart';
import '../../../../core/theme/app_colors.dart';

class ChangeLanguageDialog extends ConsumerStatefulWidget {
  final void Function() onPressed;
  const ChangeLanguageDialog({
    super.key,
    required this.onPressed,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChangeLanguageDialogState();
}

class _ChangeLanguageDialogState extends ConsumerState<ChangeLanguageDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleAnimationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _scaleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_scaleAnimationController);
  }

  @override
  void dispose() {
    _scaleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scaleAnimationController.forward();
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      content: ScaleTransition(
        scale: Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: _scaleAnimation,
            curve: Curves.easeInOut,
          ),
        ),
        child: Container(
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
                    isSelected:
                        ref.watch(languageProvider).languageCode == "en",
                  ),
                  12.height,
                  LanguageItem(
                    language: "Hindi",
                    locale: const Locale('hi', 'IN'),
                    isSelected:
                        ref.watch(languageProvider).languageCode == "hi",
                  ),
                ],
              ),
              28.height,
              ElevatedButton(
                onPressed: () async {
                  final locale = ref.watch(languageProvider);
                  Map<String, String> localeMap = {
                    'languageCode': locale.languageCode,
                    'countryCode': locale.countryCode ?? ""
                  };
                  await getIt<SharedPreferencesHelper>()
                      .setString("locale", json.encode(localeMap));
                  ref.read(mainlocaleProvider.notifier).update((state) =>
                      Locale(locale.languageCode, locale.countryCode ?? ""));
                  widget.onPressed();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primary,
                ),
                child: BuildText(
                  text: "Ok,Let's go ->",
                  weight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
