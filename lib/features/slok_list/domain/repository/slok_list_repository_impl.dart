import 'package:bhagvadgita/core/request/typed_response.dart';

import 'package:bhagvadgita/features/slok_list/data/model/bhagavad_gita_verse.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/typedef/app_type_def.dart';
import '../../data/datasource/slok_list_datasource.dart';
import '../../data/repository/slok_list_repository.dart';

class SlokListRepositoryImpl extends SlokListRepository {
  final SlokListDataSource _dataSource;

  SlokListRepositoryImpl({required SlokListDataSource dataSource})
      : _dataSource = dataSource;

  @override
  EitherResponse<List<BhagavadGitaVerse>> getVerses(int number) async {
    final response = await _dataSource.getVerses(number);
    if (response.status == Status.error) {
      return Left(DataResponse.error(response.message.toString()));
    }
    return Right(response);
  }
}
