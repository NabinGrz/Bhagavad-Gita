import 'package:bhagvadgita/core/dependency_injection/injector.dart';
import 'package:bhagvadgita/core/request/request_client_impl.dart';
import 'package:bhagvadgita/features/slok_list/domain/entities/slok_states/slok_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/datasource/chapter_info_datasource.dart';
import '../../data/repository/chapter_info_repository.dart';
import '../../domain/repository/chapter_info_repository_impl.dart';
import '../../domain/usecase/chapter_info_usecase.dart';

final chapterInfoDataSrcProvider = Provider<ChapterInfoDataSource>((ref) =>
    ChapterInfoDataSourceImpl(requestClient: getIt<RequestClientImpl>()));
final chapterInfoRepoProvider = Provider<ChapterInfoRepository>((ref) =>
    ChapterInfoRepositoryImpl(
        dataSource: ref.read(chapterInfoDataSrcProvider)));
final chapterInfoUseCase = Provider<ChapterInfoUseCase>(
    (ref) => ChapterInfoUseCase(repository: ref.read(chapterInfoRepoProvider)));

final chapterInfoProvider =
    StateNotifierProvider<ChapterInfoNotifier, SlokState>(
        (ref) => ChapterInfoNotifier(ref.watch(chapterInfoUseCase)));

final showMoreProvider = StateProvider<bool>((ref) => false);

class ChapterInfoNotifier extends StateNotifier<SlokState> {
  final ChapterInfoUseCase _useCase;
  ChapterInfoNotifier(this._useCase) : super(const SlokState.initial());

  Future<void> chapterInfo(int number) async {
    state = const SlokState.loading();
    final data = await _useCase.execute(number);
    data.fold((l) {
      state = SlokState.failure(l.message ?? "Something went wrong");
    }, (r) {
      state = SlokState.success(data: null, chapterInfo: r, detail: null);
    });
  }
}
