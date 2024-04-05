import 'package:bhagvadgita/features/splash/presentation/provider/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../core/dependency_injection/injector.dart';
import '../core/helper/shared_preference_helper.dart';
import '../core/route/route.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  get notifier => ref.read(onboardingShownProvider.notifier);

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () async {
      bool isShown = ref.watch(onboardingShownProvider);
      if (isShown) {
        AppRouter.pushNamedAndRemoveUntil(
            context: context, routeName: AppRouter.adhyayaListScreen);
      } else {
        getIt<SharedPreferencesHelper>().setBool('onboardingShown', true);
        ref.read(onboardingShownProvider.notifier).update((state) => true);
        AppRouter.pushNamedAndRemoveUntil(
            context: context, routeName: AppRouter.onBoardingScreen);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/splashImage.png"),
        fit: BoxFit.fill,
      )),
    ));
  }
}
