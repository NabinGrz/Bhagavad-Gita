import 'package:bhagvadgita/core/features/onboarding/presentation/providers/onboarding_providers.dart';
import 'package:bhagvadgita/core/localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/dependency_injection/injector.dart';
import 'core/features/language_change/presentation/providers/language_provider.dart';
import 'core/features/splash/presentation/screens/splash_screen.dart';
import 'core/route/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.setUpLocator();
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  Locale locale = const Locale("en", 'US');

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      textTheme: GoogleFonts.interTextTheme(baseTheme.textTheme),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 640),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, snapshot) {
          return MaterialApp(
            title: 'Bhagavad Gita',
            theme: _buildTheme(Brightness.light),
            locale: ref.watch(languageProvider),
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var locale in supportedLocales) {
                if (locale.languageCode == deviceLocale!.languageCode &&
                    locale.countryCode == deviceLocale.countryCode) {
                  return deviceLocale;
                }
              }
              return supportedLocales.first;
            },
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalization.delegate,
            ],
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ne', 'NP'),
            ],
            onGenerateRoute: AppRouter.onGenerateRoute,
            home: const SplashScreen(),
          );
        });
  }
}


// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   Locale locale = const Locale("en", 'US');

//   ThemeData _buildTheme(brightness) {
//     var baseTheme = ThemeData(brightness: brightness);

//     return baseTheme.copyWith(
//       textTheme: GoogleFonts.interTextTheme(baseTheme.textTheme),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Bhagavad Gita',
//       theme: _buildTheme(Brightness.light),
//       locale: locale,
//       localeResolutionCallback: (deviceLocale, supportedLocales) {
//         for (var locale in supportedLocales) {
//           if (locale.languageCode == deviceLocale!.languageCode &&
//               locale.countryCode == deviceLocale.countryCode) {
//             return deviceLocale;
//           }
//         }
//         return supportedLocales.first;
//       },
//       localizationsDelegates: const [
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//         AppLocalization.delegate,
//       ],
//       supportedLocales: const [
//         Locale('en', 'US'),
//         Locale('ne', 'NP'),
//       ],
//       onGenerateRoute: AppRouter.onGenerateRoute,
//       home: const SplashScreen(),
//     );
//   }

// }

