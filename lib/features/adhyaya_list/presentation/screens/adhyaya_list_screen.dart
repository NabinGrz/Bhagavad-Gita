import 'package:bhagvadgita/core/extensions/num_extension.dart';
import 'package:bhagvadgita/core/shared/widgets/build_text.dart';
import 'package:bhagvadgita/core/theme/text_styles.dart';
import 'package:bhagvadgita/features/adhyaya_list/presentation/providers/adhyaya_list_provider.dart';
import 'package:bhagvadgita/features/language_change/presentation/screens/language_change_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/shared/widgets/custom_loader.dart';
import '../widgets/chapter_list_tile.dart';
import '../widgets/detail_widget.dart';
import '../widgets/header.dart';

class AdhyayaListScreen extends ConsumerStatefulWidget {
  const AdhyayaListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdhyayaListScreenState();
}

class _AdhyayaListScreenState extends ConsumerState<AdhyayaListScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeAnimationController;
  late AnimationController _sizeAnimationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _sizeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_fadeAnimationController);
    _sizeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_sizeAnimationController);
  }

  @override
  void dispose() {
    _fadeAnimationController.dispose();
    _sizeAnimationController.dispose();
    super.dispose();
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
                  builder: (context) => ChangeLanguageDialog(
                    onPressed: () => Navigator.pop(context),
                  ),
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
            _fadeAnimationController.forward();
            _sizeAnimationController.forward();
            return value.fold(
                (l) => BuildText(
                      text: "${l.message}",
                    ),
                (r) => SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      child: AnimatedBuilder(
                          animation: _fadeAnimation,
                          builder: (context, child) {
                            return Opacity(
                              opacity: _fadeAnimation.value,
                              child: Column(
                                children: [
                                  const Header(),
                                  25.height,
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizeTransition(
                                            sizeFactor:
                                                Tween<double>(begin: 0, end: 1)
                                                    .animate(
                                              CurvedAnimation(
                                                parent: _sizeAnimation,
                                                curve: Curves.easeInOut,
                                              ),
                                            ),
                                            child: const DetailWidget()),
                                        ListView.separated(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
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
                                            return ChapterListTile(
                                                chapter: chapter);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ));
          },
          error: (error, stackTrace) {
            return Center(child: Text("$error"));
          },
          loading: () => const CustomLoader()),
    );
  }
}
