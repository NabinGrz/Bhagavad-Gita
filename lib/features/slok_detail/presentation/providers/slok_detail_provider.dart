import 'package:bhagvadgita/core/dependency_injection/injector.dart';
import 'package:bhagvadgita/core/request/request_client_impl.dart';
import 'package:bhagvadgita/features/slok_list/domain/entities/slok_states/slok_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/helper/shared_preference_helper.dart';
import '../../../slok_list/data/model/bhagavad_gita_verse.dart';
import '../../data/datasource/slok_detail_datasource.dart';
import '../../data/repository/slok_detail_repository.dart';
import '../../domain/repository/slok_detail_repository_impl.dart';
import '../../domain/usecase/slok_detail_usecase.dart';

final slokDetailDataSrcProvider = Provider<SlokDetailDataSource>((ref) =>
    SlokDetailDataSourceImpl(requestClient: getIt<RequestClientImpl>()));
final slokDetailRepoProvider = Provider<SlokDetailRepository>((ref) =>
    SlokDetailRepositoryImpl(dataSource: ref.read(slokDetailDataSrcProvider)));
final slokDetailUseCase = Provider<SlokDetailUseCase>(
    (ref) => SlokDetailUseCase(repository: ref.read(slokDetailRepoProvider)));

final slokDetailProvider = StateNotifierProvider<SlokDetailNotifier, SlokState>(
    (ref) => SlokDetailNotifier(ref.watch(slokDetailUseCase)));

final favoriteProvider = StateProvider<List<String>?>((ref) {
  final favorites = getIt<SharedPreferencesHelper>().getStringList("favorites");
  return favorites;
});

class SlokDetailNotifier extends StateNotifier<SlokState> {
  final SlokDetailUseCase _useCase;
  SlokDetailNotifier(this._useCase) : super(const SlokState.initial());

  Future<void> slokDetail(int chapterNum, int verseNum) async {
    state = const SlokState.loading();
    final data = await _useCase.execute(chapterNum, verseNum);
    data.fold((l) {
      state = SlokState.failure(l.message ?? "Something went wrong");
    }, (r) {
      state = SlokState.success(data: null, chapterInfo: null, detail: r);
    });
  }

  Future<void> toggleFavorite(
      BhagavadGitaVerse? data, bool isFavorite, WidgetRef ref) async {
    List<String>? favorites =
        getIt<SharedPreferencesHelper>().getStringList("favorites");
    final id = data?.id.toString();
    if (isFavorite) {
      if (id != null) {
        favorites?.remove(id);
        getIt<SharedPreferencesHelper>()
            .setStringList("favorites", favorites ?? []);
        ref.read(favoriteProvider.notifier).update((state) => favorites ?? []);
      }
    } else {
      if (id != null && favorites?.contains(id) != true) {
        getIt<SharedPreferencesHelper>()
            .setStringList("favorites", [...favorites ?? [], id]);
        ref
            .read(favoriteProvider.notifier)
            .update((state) => [...favorites ?? [], id]);
      }
    }
  }
}
