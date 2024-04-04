// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bhagavad_gita_verse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BhagavadGitaVerseImpl _$$BhagavadGitaVerseImplFromJson(
        Map<String, dynamic> json) =>
    _$BhagavadGitaVerseImpl(
      id: json['id'] as int,
      verseNumber: json['verse_number'] as int,
      chapterNumber: json['chapter_number'] as int,
      slug: json['slug'] as String,
      text: json['text'] as String,
      transliteration: json['transliteration'] as String,
      wordMeanings: json['word_meanings'] as String,
      translations: (json['translations'] as List<dynamic>)
          .map((e) => Translation.fromJson(e as Map<String, dynamic>))
          .toList(),
      commentaries: (json['commentaries'] as List<dynamic>)
          .map((e) => Commentary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BhagavadGitaVerseImplToJson(
        _$BhagavadGitaVerseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'verse_number': instance.verseNumber,
      'chapter_number': instance.chapterNumber,
      'slug': instance.slug,
      'text': instance.text,
      'transliteration': instance.transliteration,
      'word_meanings': instance.wordMeanings,
      'translations': instance.translations,
      'commentaries': instance.commentaries,
    };

_$TranslationImpl _$$TranslationImplFromJson(Map<String, dynamic> json) =>
    _$TranslationImpl(
      id: json['id'] as int,
      description: json['description'] as String,
      authorName: json['author_name'] as String,
      language: json['language'] as String,
    );

Map<String, dynamic> _$$TranslationImplToJson(_$TranslationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'author_name': instance.authorName,
      'language': instance.language,
    };

_$CommentaryImpl _$$CommentaryImplFromJson(Map<String, dynamic> json) =>
    _$CommentaryImpl(
      id: json['id'] as int,
      description: json['description'] as String,
      authorName: json['author_name'] as String,
      language: json['language'] as String,
    );

Map<String, dynamic> _$$CommentaryImplToJson(_$CommentaryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'author_name': instance.authorName,
      'language': instance.language,
    };
