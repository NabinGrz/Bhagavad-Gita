import 'package:bhagvadgita/core/request/typed_response.dart';

import 'package:bhagvadgita/features/slok_list/data/model/bhagavad_gita_verse.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/typedef/app_type_def.dart';
import '../../data/datasource/slok_detail_datasource.dart';
import '../../data/repository/slok_detail_repository.dart';

class SlokDetailRepositoryImpl extends SlokDetailRepository {
  final SlokDetailDataSource _dataSource;

  SlokDetailRepositoryImpl({required SlokDetailDataSource dataSource})
      : _dataSource = dataSource;

  @override
  EitherResponse<BhagavadGitaVerse> getSlokDetail(
      int chapterNum, int verseNum) async {
    final response = await _dataSource.getSlokDetail(chapterNum, verseNum);
    if (response.status == Status.error) {
      return Left(DataResponse.error(response.message.toString()));
    }
    return Right(response);
  }
}
