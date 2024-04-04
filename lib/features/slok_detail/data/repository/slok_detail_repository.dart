import 'package:bhagvadgita/core/typedef/app_type_def.dart';

import '../../../slok_list/data/model/bhagavad_gita_verse.dart';

abstract class SlokDetailRepository {
  EitherResponse<BhagavadGitaVerse> getSlokDetail(int chapterNum, int verseNum);
}
