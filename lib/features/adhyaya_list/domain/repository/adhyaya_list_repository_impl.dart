import 'package:bhagvadgita/core/request/typed_response.dart';
import 'package:bhagvadgita/features/adhyaya_list/data/datasource/adhaya_list_datasource.dart';

import 'package:bhagvadgita/features/adhyaya_list/data/model/bhagavad_gita_chapters.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/typedef/app_type_def.dart';
import '../../data/repository/adhyaya_list_repository.dart';

class AdhyayaListRepositoryImpl extends AdhyayaListRepository {
  final AdhyayaListDataSource _dataSource;

  AdhyayaListRepositoryImpl({required AdhyayaListDataSource dataSource})
      : _dataSource = dataSource;

  @override
  EitherResponse<List<BhagavadGitaChapter>> getChapters() async {
    final response = await _dataSource.getChapters();
    if (response.status == Status.error) {
      return Left(DataResponse.error(response.message.toString()));
    }
    return Right(response);
  }
}
