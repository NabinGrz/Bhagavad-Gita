import 'dart:convert';

import 'package:bhagvadgita/core/extensions/string_extension.dart';
import 'package:bhagvadgita/features/onboarding/presentation/providers/onboarding_providers.dart';
import 'package:bhagvadgita/core/helper/shared_preference_helper.dart';
import 'package:bhagvadgita/features/language_change/presentation/screens/language_change_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/dependency_injection/injector.dart';
import '../../../../core/route/route.dart';
import '../../../language_change/presentation/providers/language_provider.dart';

class OnBoardingScreen extends ConsumerWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(languageProvider.notifier);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${ref.watch(languageProvider).countryCode}"),
            ElevatedButton(
                onPressed: () async {
                  Map<String, String> localeMap = {
                    'languageCode': 'ne',
                    'countryCode': 'NP'
                  };
                  await getIt<SharedPreferencesHelper>()
                      .setString("locale", json.encode(localeMap));
                  notifier.update((state) => const Locale('ne', 'NP'));
                },
                child: const Text("Nepali")),
            ElevatedButton(
                onPressed: () async {
                  Map<String, String> localeMap = {
                    'languageCode': 'en',
                    'countryCode': 'US'
                  };
                  await getIt<SharedPreferencesHelper>()
                      .setString("locale", json.encode(localeMap));
                  notifier.update((state) => const Locale('en', 'US'));
                },
                child: const Text("English")),
            InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (_) => const ChangeLanguageDialog());
                  // AppRouter.pushNamed(
                  //     context: context, routeName: AppRouter.homeScreen);
                },
                child: Text("welcome".localize(context))),
          ],
        ),
      ),
    );
  }
}
