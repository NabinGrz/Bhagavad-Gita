import 'package:bhagvadgita/core/extensions/num_extension.dart';
import 'package:bhagvadgita/core/shared/widgets/custom_loader.dart';
import 'package:bhagvadgita/core/theme/app_colors.dart';
import 'package:bhagvadgita/core/theme/text_styles.dart';
import 'package:bhagvadgita/features/slok_detail/presentation/providers/slok_detail_provider.dart';
import 'package:bhagvadgita/features/slok_detail/presentation/widgets/slok_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/shared/widgets/error_widget.dart';
import '../../../language_change/presentation/screens/language_change_dialog.dart';
import '../../../slok_list/domain/entities/slok_states/slok_state.dart';

class SlokDetailScreen extends ConsumerStatefulWidget {
  const SlokDetailScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SlokDetailScreenState();
}

class _SlokDetailScreenState extends ConsumerState<SlokDetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeAnimationController;
  late Animation<double> _fadeAnimation;
  SlokDetailNotifier get slokdetailnotifier =>
      ref.read(slokDetailProvider.notifier);
  get argument =>
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
      await slokdetailnotifier.slokDetail(
          argument?['chapter_number'], argument?['verse_number']);
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
    final notifier = ref.read(slokDetailProvider.notifier);
    final detail = ref.watch(slokDetailProvider);
    final isLoading = detail is Loading;
    final hasError = detail is Failure;
    final data = detail is Success ? detail.detail?.data : null;
    final errorMsg = hasError ? detail.failedAppStateResponse : null;
    final isFavorite =
        ref.watch(favoriteProvider)?.contains(data?.id.toString()) ?? false;
    return Scaffold(
      appBar: isLoading
          ? null
          : AppBar(
              actions: hasError
                  ? null
                  : [
                      InkWell(
                        splashColor: AppColor.primary.withOpacity(0.3),
                        highlightColor: AppColor.primary.withOpacity(0.1),
                        onTap: () async => await notifier.toggleFavorite(
                            data, isFavorite, ref),
                        child: Icon(
                          isFavorite ? Icons.bookmark : Icons.bookmark_outline,
                          color: isFavorite ? AppColor.primary : null,
                        ),
                      ),
                      20.width,
                      InkWell(
                        splashColor: AppColor.primary.withOpacity(0.3),
                        highlightColor: AppColor.primary.withOpacity(0.1),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => ChangeLanguageDialog(
                              onPressed: () => Navigator.pop(context),
                            ),
                          );
                        },
                        child: Text(
                          "Aa",
                          style: regular().copyWith(fontSize: 14.sp),
                        ),
                      ),
                      25.width,
                      const Icon(Icons.menu),
                      20.width,
                    ],
            ),
      body: isLoading
          ? const CustomLoader()
          : AnimatedBuilder(
              animation: _fadeAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _fadeAnimation.value,
                  child: hasError
                      ? CustomErrorWidget(
                          errorMsg: errorMsg ?? "Something went wrong")
                      : SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                          ),
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (detail is Success) ...{
                                25.height,
                                Text(
                                  "${data?.chapterNumber}.${data?.chapterNumber}",
                                  style: bold().copyWith(
                                    fontSize: 16.sp,
                                  ),
                                ),
                                10.height,
                                Text(
                                  "${data?.text}",
                                  textAlign: TextAlign.center,
                                  style: bold().copyWith(
                                      fontSize: 16.sp,
                                      color: const Color(0xffCB874B)),
                                ),
                                30.height,
                                SlokTranslationsWidget(
                                  detail: data,
                                  isTranslation: true,
                                ),
                                35.height,
                                const Divider(
                                  height: 1,
                                  thickness: 0.2,
                                ),
                                35.height,
                                SlokTranslationsWidget(
                                  detail: data,
                                  isTranslation: false,
                                ),
                                40.height,
                              }
                            ],
                          ),
                        ),
                );
              }),
    );
  }
}
