import 'package:bhagvadgita/core/extensions/num_extension.dart';
import 'package:bhagvadgita/core/shared/widgets/build_text.dart';
import 'package:bhagvadgita/core/theme/text_styles.dart';
import 'package:bhagvadgita/features/adhyaya_list/presentation/providers/adhyaya_list_provider.dart';
import 'package:bhagvadgita/features/language_change/presentation/screens/language_change_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/chapter_list_tile.dart';
import '../widgets/detail_widget.dart';
import '../widgets/header.dart';

class AdhyayaListScreen extends ConsumerStatefulWidget {
  const AdhyayaListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdhyayaListScreenState();
}

class _AdhyayaListScreenState extends ConsumerState<AdhyayaListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff5D2EC0),
        title: Text(
          "BHAGAVAD GITA",
          style: bold().copyWith(
            fontSize: 14.sp,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const ChangeLanguageDialog(),
                );
              },
              icon: const Icon(
                Icons.settings_outlined,
                color: Colors.white,
              ))
        ],
      ),
      body: ref.watch(chaptersProvider).when(
          data: (value) {
            return value.fold(
                (l) => BuildText(
                      text: "${l.message}",
                    ),
                (r) => SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      child: Column(
                        children: [
                          const Header(),
                          25.height,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const DetailWidget(),
                                ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemCount: r.data?.length ?? 0,
                                  separatorBuilder: (context, index) {
                                    return const Divider(
                                      height: 1,
                                      thickness: 0.5,
                                    );
                                  },
                                  itemBuilder: (context, index) {
                                    final chapter = r.data?[index];
                                    return ChapterListTile(chapter: chapter);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ));
          },
          error: (error, stackTrace) {
            return Center(child: Text("$error"));
          },
          loading: () =>
              const Center(child: CircularProgressIndicator.adaptive())),
    );
  }
}
