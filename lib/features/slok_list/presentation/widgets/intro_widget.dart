import 'package:bhagvadgita/core/extensions/num_extension.dart';
import 'package:bhagvadgita/core/theme/text_styles.dart';
import 'package:bhagvadgita/features/slok_list/presentation/providers/chapter_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/model/chapter_info.dart';

class IntroWidget extends ConsumerWidget {
  const IntroWidget({
    super.key,
    required this.chapterNumber,
    required this.chapterInfo,
  });
  final ChapterInfo? chapterInfo;
  final int chapterNumber;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/chapter1.png",
              height: 20.w,
              width: 20.w,
            ),
            25.width,
            Text(
              "CHAPTER $chapterNumber",
              style: semiBold().copyWith(
                  fontSize: 14.sp,
                  color: const Color(
                    0xff0038FF,
                  )),
            ),
            25.width,
            Image.asset(
              "assets/images/chapter1.png",
              height: 20.w,
              width: 20.w,
            ),
          ],
        ),
        10.height,
        Text(
          "${chapterInfo?.nameTranslated}",
          style: semiBold().copyWith(
            fontSize: 13.sp,
          ),
        ),
        25.height,
        ref.watch(showMoreProvider)
            ? Text(
                "${chapterInfo?.chapterSummary}",
                style: regular().copyWith(
                  fontSize: 14.sp,
                ),
              )
            : Text(
                "${chapterInfo?.chapterSummary}",
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: regular().copyWith(
                  fontSize: 14.sp,
                ),
              ),
        Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
                onPressed: () {
                  ref.read(showMoreProvider.notifier).update((state) => !state);
                },
                child: Text(
                    "SHOW ${ref.watch(showMoreProvider) ? "LESS" : "MORE"}"))),
        25.height,
      ],
    );
  }
}
