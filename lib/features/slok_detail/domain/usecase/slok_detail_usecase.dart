import 'package:bhagvadgita/core/typedef/app_type_def.dart';
import 'package:bhagvadgita/features/slok_list/data/model/bhagavad_gita_verse.dart';

import '../../data/repository/slok_detail_repository.dart';

class SlokDetailUseCase {
  final SlokDetailRepository _repository;

  SlokDetailUseCase({required SlokDetailRepository repository})
      : _repository = repository;

  EitherResponse<BhagavadGitaVerse> execute(
      int chapterNum, int verseNum) async {
    return await _repository.getSlokDetail(chapterNum, verseNum);
  }
}
