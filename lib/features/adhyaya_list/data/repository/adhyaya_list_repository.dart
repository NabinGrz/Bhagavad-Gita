import 'package:bhagvadgita/core/typedef/app_type_def.dart';

import '../model/bhagavad_gita_chapters.dart';

abstract class AdhyayaListRepository {
  EitherResponse<List<BhagavadGitaChapter>> getChapters();
}
