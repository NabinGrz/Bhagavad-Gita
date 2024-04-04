import 'package:bhagvadgita/core/typedef/app_type_def.dart';
import 'package:bhagvadgita/features/adhyaya_list/data/model/bhagavad_gita_chapters.dart';
import 'package:bhagvadgita/features/adhyaya_list/data/repository/adhyaya_list_repository.dart';

class AdhyayaListUseCase {
  final AdhyayaListRepository _repository;

  AdhyayaListUseCase({required AdhyayaListRepository repository})
      : _repository = repository;

  EitherResponse<List<BhagavadGitaChapter>> execute() async {
    return await _repository.getChapters();
  }
}
