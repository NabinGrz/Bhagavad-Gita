import 'package:bhagvadgita/core/dependency_injection/injector.dart';
import 'package:bhagvadgita/core/request/request_client_impl.dart';
import 'package:bhagvadgita/features/slok_list/domain/entities/slok_states/slok_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/datasource/slok_list_datasource.dart';
import '../../data/repository/slok_list_repository.dart';
import '../../domain/repository/domain_list_repository_impl.dart';
import '../../domain/usecase/slok_list_usecase.dart';

final versesDataSrcProvider = Provider<SlokListDataSource>(
    (ref) => SlokListDataSourceImpl(requestClient: getIt<RequestClientImpl>()));
final versesRepoProvider = Provider<SlokListRepository>((ref) =>
    SlokListRepositoryImpl(dataSource: ref.read(versesDataSrcProvider)));
final versesUseCase = Provider<SlokListUseCase>(
    (ref) => SlokListUseCase(repository: ref.read(versesRepoProvider)));

final versesProvider = StateNotifierProvider<VersesNotifier, SlokState>(
    (ref) => VersesNotifier(ref.watch(versesUseCase)));

class VersesNotifier extends StateNotifier<SlokState> {
  final SlokListUseCase _useCase;
  VersesNotifier(this._useCase) : super(const SlokState.initial());

  Future<void> verses(int number) async {
    state = const SlokState.loading();
    final data = await _useCase.execute(number);
    data.fold((l) {
      state = SlokState.failure(l.message ?? "Something went wrong");
    }, (r) {
      state = SlokState.success(r, null);
    });
  }
}
