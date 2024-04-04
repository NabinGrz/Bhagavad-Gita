import 'package:bhagvadgita/core/extensions/num_extension.dart';
import 'package:bhagvadgita/core/theme/text_styles.dart';
import 'package:bhagvadgita/features/slok_detail/presentation/providers/slok_detail_provider.dart';
import 'package:bhagvadgita/features/slok_detail/presentation/widgets/slok_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../slok_list/domain/entities/slok_states/slok_state.dart';

class SlokDetailScreen extends ConsumerStatefulWidget {
  const SlokDetailScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SlokDetailScreenState();
}

class _SlokDetailScreenState extends ConsumerState<SlokDetailScreen> {
  SlokDetailNotifier get slokdetailnotifier =>
      ref.read(slokDetailProvider.notifier);
  get argument =>
      ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await slokdetailnotifier.slokDetail(
          argument?['chapter_number'], argument?['verse_number']);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final detail = ref.watch(slokDetailProvider);
    final isLoading = detail is Loading;
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Icon(Icons.bookmark_outline),
          20.width,
          Text(
            "Aa",
            style: regular().copyWith(fontSize: 14.sp),
          ),
          25.width,
          const Icon(Icons.menu),
          20.width,
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
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
                      "${detail.detail?.data?.chapterNumber}.${detail.detail?.data?.chapterNumber}",
                      style: bold().copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                    10.height,
                    Text(
                      "${detail.detail?.data?.text}",
                      textAlign: TextAlign.center,
                      style: bold().copyWith(
                          fontSize: 16.sp, color: const Color(0xffCB874B)),
                    ),
                    30.height,
                    SlokTranslationsWidget(
                      detail: detail.detail?.data,
                      isTranslation: true,
                    ),
                    35.height,
                    const Divider(
                      height: 1,
                      thickness: 0.2,
                    ),
                    35.height,
                    SlokTranslationsWidget(
                      detail: detail.detail?.data,
                      isTranslation: false,
                    ),
                    40.height,
                  }
                ],
              ),
            ),
    );
  }
}
