import 'package:bhagvadgita/core/dependency_injection/injector.dart';
import 'package:bhagvadgita/core/request/request_client_impl.dart';
import 'package:bhagvadgita/features/adhyaya_list/data/datasource/adhaya_list_datasource.dart';
import 'package:bhagvadgita/features/adhyaya_list/data/repository/adhyaya_list_repository.dart';
import 'package:bhagvadgita/features/adhyaya_list/domain/repository/adhyaya_list_repository_impl.dart';
import 'package:bhagvadgita/features/adhyaya_list/domain/usecase/adhyaya_list_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final chaptersDataSrcProvider = Provider<AdhyayaListDataSource>((ref) =>
    AdhyayaListDataSourceImpl(requestClient: getIt<RequestClientImpl>()));
final chaptersRepoProvider = Provider<AdhyayaListRepository>((ref) =>
    AdhyayaListRepositoryImpl(dataSource: ref.read(chaptersDataSrcProvider)));
final chaptersUseCase = Provider<AdhyayaListUseCase>(
    (ref) => AdhyayaListUseCase(repository: ref.read(chaptersRepoProvider)));

final chaptersProvider = FutureProvider((ref) async {
  final useCase = ref.watch(chaptersUseCase);
  return await useCase.execute();
});
