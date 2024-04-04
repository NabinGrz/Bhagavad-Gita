import 'dart:convert';

import 'package:bhagvadgita/core/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/dependency_injection/injector.dart';
import '../../../../core/helper/shared_preference_helper.dart';
import '../../../language_change/presentation/providers/language_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  get notifier => ref.read(languageProvider.notifier);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${ref.watch(mainlocaleProvider).countryCode}"),
            ElevatedButton(
                onPressed: () async {
                  Map<String, String> localeMap = {
                    'languageCode': 'hi',
                    'countryCode': 'IN'
                  };
                  await getIt<SharedPreferencesHelper>()
                      .setString("locale", json.encode(localeMap));
                  notifier.update((state) => const Locale('hi', 'IN'));
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
                  Navigator.pop(context);
                },
                child: Text("lastread".localize(context))),
          ],
        ),
      ),
    );
  }
}
