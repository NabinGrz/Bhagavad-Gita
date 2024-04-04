import 'package:bhagvadgita/core/typedef/app_type_def.dart';
import 'package:bhagvadgita/features/slok_list/data/model/chapter_info.dart';

import '../../data/repository/chapter_info_repository.dart';

class ChapterInfoUseCase {
  final ChapterInfoRepository _repository;

  ChapterInfoUseCase({required ChapterInfoRepository repository})
      : _repository = repository;

  EitherResponse<ChapterInfo> execute(int number) async {
    return await _repository.getChapterInfo(number);
  }
}
