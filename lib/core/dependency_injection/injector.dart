import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/shared_preference_helper.dart';

final getIt = GetIt.instance;

class Injector {
  Injector._();
  static Future<void> setUpLocator() async {
    getIt.registerSingletonAsync<SharedPreferences>(
        () async => await SharedPreferences.getInstance());
    await getIt.isReady<SharedPreferences>();
    getIt.registerSingleton<SharedPreferencesHelper>(
        SharedPreferencesHelper(getIt()));
  }
}
