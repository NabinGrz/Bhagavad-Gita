import 'package:bhagvadgita/core/extensions/num_extension.dart';
import 'package:bhagvadgita/core/route/route.dart';
import 'package:bhagvadgita/core/shared/widgets/build_text.dart';
import 'package:bhagvadgita/core/theme/app_colors.dart';
import 'package:bhagvadgita/features/adhyaya_list/data/model/bhagavad_gita_chapters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChapterListTile extends StatelessWidget {
  const ChapterListTile({
    super.key,
    required this.chapter,
  });

  final BhagavadGitaChapter? chapter;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: AppColor.primary.withOpacity(0.3),
      onTap: () {
        AppRouter.pushNamed(
            context: context,
            routeName: AppRouter.slokListScreen,
            arguments: {'chapter_number': chapter?.chapterNumber});
      },
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(11),
        decoration: const BoxDecoration(
          color: AppColor.primary,
          shape: BoxShape.circle,
        ),
        child: BuildText(
          text: "${chapter?.chapterNumber}",
          color: Colors.white,
          fontSize: 16.sp,
          weight: FontWeight.bold,
        ),
      ),
      title: BuildText(
        text: "${chapter?.nameTranslated}",
        fontSize: 16.sp,
        color: AppColor.textprimary,
      ),
      subtitle: Row(
        children: [
          Image.asset(
            "assets/images/verses.png",
            height: 12,
            width: 12,
          ),
          6.width,
          BuildText(
            text: "${chapter?.versesCount} verses",
            color: AppColor.textprimary,
          ),
        ],
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: AppColor.textprimary,
      ),
    );
  }
}
