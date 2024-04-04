import 'package:bhagvadgita/core/extensions/num_extension.dart';
import 'package:bhagvadgita/core/theme/text_styles.dart';
import 'package:bhagvadgita/features/slok_list/data/model/bhagavad_gita_verse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SlokWidget extends StatelessWidget {
  final BhagavadGitaVerse verse;
  const SlokWidget({super.key, required this.verse});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Verse ${verse.verseNumber}",
              style: semiBold().copyWith(
                fontSize: 14.sp,
              ),
            ),
            const Icon(Icons.chevron_right)
          ],
        ),
        8.height,
        Text(
          "${verse.translations.firstOrNull?.description}".trim(),
          style: regular().copyWith(
            fontSize: 14.sp,
          ),
        ),
        // const Divider()
      ],
    );
  }
}
