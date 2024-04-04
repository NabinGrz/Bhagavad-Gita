import 'package:freezed_annotation/freezed_annotation.dart';

part 'bhagavad_gita_verse.freezed.dart';
part 'bhagavad_gita_verse.g.dart';

@freezed
abstract class BhagavadGitaVerse with _$BhagavadGitaVerse {
  const factory BhagavadGitaVerse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'verse_number') required int verseNumber,
    @JsonKey(name: 'chapter_number') required int chapterNumber,
    @JsonKey(name: 'slug') required String slug,
    @JsonKey(name: 'text') required String text,
    @JsonKey(name: 'transliteration') required String transliteration,
    @JsonKey(name: 'word_meanings') required String wordMeanings,
    @JsonKey(name: 'translations') required List<Translation> translations,
    @JsonKey(name: 'commentaries') required List<Commentary> commentaries,
  }) = _BhagavadGitaVerse;

  factory BhagavadGitaVerse.fromJson(Map<String, dynamic> json) =>
      _$BhagavadGitaVerseFromJson(json);
}

@freezed
abstract class Translation with _$Translation {
  const factory Translation({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'author_name') required String authorName,
    @JsonKey(name: 'language') required String language,
  }) = _Translation;

  factory Translation.fromJson(Map<String, dynamic> json) =>
      _$TranslationFromJson(json);
}

@freezed
abstract class Commentary with _$Commentary {
  const factory Commentary({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'author_name') required String authorName,
    @JsonKey(name: 'language') required String language,
  }) = _Commentary;

  factory Commentary.fromJson(Map<String, dynamic> json) =>
      _$CommentaryFromJson(json);
}
