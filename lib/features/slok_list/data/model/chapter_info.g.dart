// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChapterInfoImpl _$$ChapterInfoImplFromJson(Map<String, dynamic> json) =>
    _$ChapterInfoImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String,
      nameTransliterated: json['name_transliterated'] as String,
      nameTranslated: json['name_translated'] as String,
      versesCount: json['verses_count'] as int,
      chapterNumber: json['chapter_number'] as int,
      nameMeaning: json['name_meaning'] as String,
      chapterSummary: json['chapter_summary'] as String,
      chapterSummaryHindi: json['chapter_summary_hindi'] as String,
    );

Map<String, dynamic> _$$ChapterInfoImplToJson(_$ChapterInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'name_transliterated': instance.nameTransliterated,
      'name_translated': instance.nameTranslated,
      'verses_count': instance.versesCount,
      'chapter_number': instance.chapterNumber,
      'name_meaning': instance.nameMeaning,
      'chapter_summary': instance.chapterSummary,
      'chapter_summary_hindi': instance.chapterSummaryHindi,
    };
