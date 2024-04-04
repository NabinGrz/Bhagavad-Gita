import 'package:bhagvadgita/core/typedef/app_type_def.dart';

import '../model/bhagavad_gita_verse.dart';

abstract class SlokListRepository {
  EitherResponse<List<BhagavadGitaVerse>> getVerses(int number);
}
