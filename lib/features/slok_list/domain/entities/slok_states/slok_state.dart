import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/bhagavad_gita_verse.dart';
import '../../../../../core/request/typed_response.dart';
import '../../../data/model/chapter_info.dart';

part 'slok_state.freezed.dart';

@freezed
abstract class SlokState with _$SlokState {
  const factory SlokState.initial() = Initial;
  const factory SlokState.loading() = Loading;
  const factory SlokState.failure(String failedAppStateResponse) = Failure;
  const factory SlokState.success(DataResponse<List<BhagavadGitaVerse>>? data,
      DataResponse<ChapterInfo>? chapterInfo) = Success;
}
