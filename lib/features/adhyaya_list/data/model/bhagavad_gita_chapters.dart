import 'package:freezed_annotation/freezed_annotation.dart';

part 'bhagavad_gita_chapters.freezed.dart';
part 'bhagavad_gita_chapters.g.dart';

@freezed
abstract class BhagavadGitaChapter with _$BhagavadGitaChapter {
  const factory BhagavadGitaChapter({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'slug') required String slug,
    @JsonKey(name: 'name_transliterated') required String nameTransliterated,
    @JsonKey(name: 'name_translated') required String nameTranslated,
    @JsonKey(name: 'verses_count') required int versesCount,
    @JsonKey(name: 'chapter_number') required int chapterNumber,
    @JsonKey(name: 'name_meaning') required String nameMeaning,
    @JsonKey(name: 'chapter_summary') required String chapterSummary,
    @JsonKey(name: 'chapter_summary_hindi') required String chapterSummaryHindi,
  }) = _BhagavadGitaChapter;

  factory BhagavadGitaChapter.fromJson(Map<String, dynamic> json) =>
      _$BhagavadGitaChapterFromJson(json);
}
