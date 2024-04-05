import 'package:bhagvadgita/core/extensions/num_extension.dart';
import 'package:bhagvadgita/core/shared/widgets/error_widget.dart';
import 'package:bhagvadgita/features/slok_list/domain/entities/slok_states/slok_state.dart';
import 'package:bhagvadgita/features/slok_list/presentation/providers/chapter_info_provider.dart';
import 'package:bhagvadgita/features/slok_list/presentation/providers/slok_list_provider.dart';
import 'package:bhagvadgita/features/slok_list/presentation/widgets/slok_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/shared/widgets/custom_loader.dart';
import '../widgets/intro_widget.dart';

class SlokListScreen extends ConsumerStatefulWidget {
  const SlokListScreen({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SlokListScreenState();
}

class _SlokListScreenState extends ConsumerState<SlokListScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeAnimationController;
  late Animation<double> _fadeAnimation;
  VersesNotifier get versesnotifier => ref.read(versesProvider.notifier);
  ChapterInfoNotifier get chapterInfonotifier =>
      ref.read(chapterInfoProvider.notifier);
  get chapterNumber =>
      ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

  @override
  void initState() {
    _fadeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_fadeAnimationController);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.wait([
        versesnotifier.verses(chapterNumber?['chapter_number']),
        chapterInfonotifier.chapterInfo(chapterNumber?['chapter_number'])
      ]);
      _fadeAnimationController.forward();
    });

    super.initState();
  }

  @override
  void dispose() {
    _fadeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final verses = ref.watch(versesProvider);
    final chapterInfo = ref.watch(chapterInfoProvider);
    final isLoading = verses is Loading || chapterInfo is Loading;
    final hasError = verses is Failure || chapterInfo is Failure;
    final verseErrorMsg =
        verses is Failure ? verses.failedAppStateResponse : null;
    final chapterInfoErrorMsg =
        chapterInfo is Failure ? chapterInfo.failedAppStateResponse : null;

    return Scaffold(
      appBar: isLoading ? null : AppBar(),
      body: isLoading
          ? const CustomLoader()
          : AnimatedBuilder(
              animation: _fadeAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _fadeAnimation.value,
                  child: hasError
                      ? CustomErrorWidget(
                          errorMsg: verseErrorMsg ??
                              chapterInfoErrorMsg ??
                              "Something went wrong")
                      : Container(
                          alignment: Alignment.topCenter,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/slokbackground.png"))),
                          child: SingleChildScrollView(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                            ),
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (chapterInfo is Success) ...{
                                  IntroWidget(
                                      chapterInfo:
                                          chapterInfo.chapterInfo?.data,
                                      chapterNumber:
                                          chapterNumber?['chapter_number'])
                                },
                                if (verses is Success) ...{
                                  (verses.data?.data != null &&
                                          verses.data!.data!.isNotEmpty)
                                      ? ListView.separated(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          padding: EdgeInsets.zero,
                                          itemCount:
                                              verses.data?.data?.length ?? 0,
                                          separatorBuilder: (context, index) {
                                            return Divider(
                                              height: 25.h,
                                              thickness: 0.5,
                                            );
                                          },
                                          itemBuilder: (context, index) {
                                            return SlokWidget(
                                                verse:
                                                    verses.data!.data![index]);
                                          },
                                        )
                                      : const Center(
                                          child: Text("Empty"),
                                        )
                                },
                                40.height,
                              ],
                            ),
                          ),
                        ),
                );
              }),
    );
  }
}
