import 'package:bhagvadgita/core/typedef/app_type_def.dart';
import 'package:bhagvadgita/features/slok_list/data/model/chapter_info.dart';


abstract class ChapterInfoRepository {
  EitherResponse<ChapterInfo> getChapterInfo(int number);
}
