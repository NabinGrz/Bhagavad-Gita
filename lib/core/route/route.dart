// import 'package:flutter/material.dart';

// pushTo({required BuildContext context, required Widget screen}) =>
//     Navigator.push(context, MaterialPageRoute(builder: (c) => screen));
// pushAndRemoveUpto({required BuildContext context, required Widget screen}) =>
//     Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (c) => screen),
//         (Route<dynamic> route) => false);

import 'package:bhagvadgita/features/adhyaya_list/presentation/screens/adhyaya_list_screen.dart';
import 'package:bhagvadgita/features/home/presentation/screens/home_screen.dart';
import 'package:bhagvadgita/features/slok_detail/presentation/screens/slok_detail_screen.dart';
import 'package:bhagvadgita/features/slok_list/presentation/screens/slok_list_screen.dart';
import 'package:flutter/material.dart';

import '../../features/onboarding/presentation/screens/onboarding_screen.dart';

class AppRouter {
  const AppRouter._();

  static const onBoardingScreen = "/onBoarding";
  static const homeScreen = "/home";
  static const adhyayaListScreen = "/adhyayaListScreen";
  static const slokListScreen = "/slokListScreen";
  static const slokDetailScreen = "/slokDetailScreen";
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onBoardingScreen:
        return navigate(settings, const OnBoardingScreen());
      case homeScreen:
        return navigate(settings, const HomeScreen());
      case adhyayaListScreen:
        return navigate(settings, const AdhyayaListScreen());
      case slokListScreen:
        return navigate(settings, const SlokListScreen());
      case slokDetailScreen:
        return navigate(settings, const SlokDetailScreen());
      default:
        throw Exception(["Route Not Found!!"]);
    }
  }

  static MaterialPageRoute<dynamic> navigate(
      RouteSettings settings, Widget widget) {
    return MaterialPageRoute<dynamic>(
        builder: (_) => widget, settings: settings);
  }

  static void pushNamed({
    required BuildContext context,
    required String routeName,
    Object? arguments,
  }) {
    Navigator.pushNamed(
      context,
      routeName,
      arguments: arguments,
    );
  }

  static void pushNamedAndRemoveUntil({
    required BuildContext context,
    required String routeName,
  }) =>
      Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
}
