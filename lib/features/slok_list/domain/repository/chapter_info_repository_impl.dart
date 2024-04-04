import 'package:bhagvadgita/core/request/typed_response.dart';

import 'package:bhagvadgita/features/slok_list/data/model/chapter_info.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/typedef/app_type_def.dart';
import '../../data/datasource/chapter_info_datasource.dart';
import '../../data/repository/chapter_info_repository.dart';

class ChapterInfoRepositoryImpl extends ChapterInfoRepository {
  final ChapterInfoDataSource _dataSource;

  ChapterInfoRepositoryImpl({required ChapterInfoDataSource dataSource})
      : _dataSource = dataSource;

  @override
  EitherResponse<ChapterInfo> getChapterInfo(int number) async {
    final response = await _dataSource.getChapterInfo(number);
    if (response.status == Status.error) {
      return Left(DataResponse.error(response.message.toString()));
    }
    return Right(response);
  }
}
