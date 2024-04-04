import 'package:bhagvadgita/core/dependency_injection/injector.dart';
import 'package:bhagvadgita/core/helper/shared_preference_helper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final onboardingShownProvider = StateProvider<bool>((ref) {
  final isOnboardingShown =
      getIt<SharedPreferencesHelper>().getBool('onboardingShown');
  return isOnboardingShown;
});
