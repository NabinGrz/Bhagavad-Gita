import 'package:bhagvadgita/core/extensions/num_extension.dart';
import 'package:bhagvadgita/core/extensions/string_extension.dart';
import 'package:bhagvadgita/core/theme/app_colors.dart';
import 'package:bhagvadgita/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../slok_list/data/model/bhagavad_gita_verse.dart';

class SlokTranslationsWidget extends StatelessWidget {
  final bool isTranslation;
  const SlokTranslationsWidget({
    super.key,
    required this.detail,
    required this.isTranslation,
  });

  final BhagavadGitaVerse? detail;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: isTranslation
          ? detail?.translations.length ?? 0
          : detail?.commentaries.length ?? 0,
      separatorBuilder: (context, index) {
        return 20.height;
      },
      itemBuilder: (context, index) {
        final translation = isTranslation ? detail?.translations[index] : null;
        final commentary = isTranslation ? null : detail?.commentaries[index];
        return Column(
          children: [
            Text(
              (isTranslation ? "translation" : "commentary").localize(context),
              style: bold().copyWith(
                color: AppColor.textprimary,
                fontSize: 16.sp,
              ),
            ),
            18.height,
            Text(
              "${isTranslation ? translation?.description : commentary?.description}"
                  .trim(),
              textAlign: TextAlign.center,
              style: regular().copyWith(
                color: AppColor.textprimary,
                fontSize: 14.sp,
              ),
            ),
            18.height,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "${isTranslation ? translation?.authorName : commentary?.authorName}"
                    .trim(),
                textAlign: TextAlign.center,
                style: medium().copyWith(
                  color: const Color(0xffF67903),
                  fontSize: 12.sp,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
