import 'package:bhagvadgita/core/extensions/num_extension.dart';
import 'package:bhagvadgita/core/shared/widgets/build_text.dart';
import 'package:bhagvadgita/core/theme/app_colors.dart';
import 'package:bhagvadgita/features/onboarding/domain/entities/onboarding_model.dart';
import 'package:bhagvadgita/features/onboarding/presentation/providers/onboarding_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnBoardingScreen extends ConsumerWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(pageIndexProvider.notifier);
    final controller = PageController();
    final currentIndex = ref.watch(pageIndexProvider);
    List<OnBoardingModel> onboardinglist = [
      OnBoardingModel(
          image: "assets/images/onboardingImg1.png",
          title: "Bhagavad Gita - Simplified",
          subtitle: "Read the Gita anytime,\n where ever you wish"),
      OnBoardingModel(
          image: "assets/images/onboardingImg2.png",
          title: "Multi Language",
          subtitle:
              "It build in two languages Hindi,\n English with best and easy translation "),
      OnBoardingModel(
          image: "assets/images/onboardingImg3.png",
          title: "Audio Book",
          subtitle:
              "You can listen the book in Hindi,\n English while doing your work"),
      OnBoardingModel(
          image: "assets/images/onboardingImg4.png",
          title: "Let’s Start",
          subtitle: "Start app and enjoy it"),
    ];
    const style = SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(style);

    return Scaffold(
        backgroundColor: const Color(0xff15161B),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: onboardinglist.length,
                onPageChanged: (value) {
                  notifier.update((state) => value);
                },
                itemBuilder: (context, i) {
                  return OnBoardingItem(
                    image: onboardinglist[i].image,
                    title: onboardinglist[i].title,
                    subtitle: onboardinglist[i].subtitle,
                  );
                },
              ),
            ),
            if (currentIndex == 3) ...{
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primary,
                ),
                child: BuildText(
                  text: "Get started",
                  weight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              )
            },
            if (currentIndex != 3) ...{
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      controller.animateToPage(currentIndex - 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    },
                    child: BuildText(
                      text: "SKIP",
                      color: Colors.white,
                      fontSize: 14.sp,
                      weight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(onboardinglist.length, (i) {
                      return Container(
                        height: 10,
                        width: currentIndex == i ? 25 : 10,
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            color: currentIndex == i
                                ? AppColor.primary
                                : AppColor.primary.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20)),
                      );
                    }),
                  ),
                  InkWell(
                    onTap: () {
                      controller.animateToPage(currentIndex + 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    },
                    child: BuildText(
                      text: "NEXT ->",
                      color: Colors.white,
                      fontSize: 14.sp,
                      weight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            },
            20.height
          ],
        ));
  }
}

class OnBoardingItem extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const OnBoardingItem({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 247.w,
            width: 247.w,
          ),
          8.height,
          BuildText(
            text: title,
            fontSize: 20.sp,
            color: Colors.white,
            weight: FontWeight.bold,
          ),
          8.height,
          BuildText(
            text: subtitle,
            fontSize: 16.sp,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
