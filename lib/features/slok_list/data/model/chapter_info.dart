import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_info.freezed.dart';
part 'chapter_info.g.dart';

@freezed
class ChapterInfo with _$ChapterInfo {
  const factory ChapterInfo({
    required int id,
    required String name,
    required String slug,
    @JsonKey(name: 'name_transliterated') required String nameTransliterated,
    @JsonKey(name: 'name_translated') required String nameTranslated,
    @JsonKey(name: 'verses_count') required int versesCount,
    @JsonKey(name: 'chapter_number') required int chapterNumber,
    @JsonKey(name: 'name_meaning') required String nameMeaning,
    @JsonKey(name: 'chapter_summary') required String chapterSummary,
    @JsonKey(name: 'chapter_summary_hindi') required String chapterSummaryHindi,
  }) = _ChapterInfo;

  factory ChapterInfo.fromJson(Map<String, dynamic> json) =>
      _$ChapterInfoFromJson(json);
}
