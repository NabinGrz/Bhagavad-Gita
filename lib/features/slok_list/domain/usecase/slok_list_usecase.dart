import 'package:bhagvadgita/core/typedef/app_type_def.dart';
import 'package:bhagvadgita/features/slok_list/data/model/bhagavad_gita_verse.dart';

import '../../data/repository/slok_list_repository.dart';

class SlokListUseCase {
  final SlokListRepository _repository;

  SlokListUseCase({required SlokListRepository repository})
      : _repository = repository;

  EitherResponse<List<BhagavadGitaVerse>> execute(int number) async {
    return await _repository.getVerses(number);
  }
}
