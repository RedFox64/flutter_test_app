// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_preview_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterPreviewList _$CharacterPreviewListFromJson(
        Map<String, dynamic> json) =>
    CharacterPreviewList(
      info: InfoResponce.fromJson(json['info'] as Map<String, dynamic>),
      characterPreviewList: (json['results'] as List<dynamic>)
          .map((e) => CharacterPreview.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterPreviewListToJson(
        CharacterPreviewList instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.characterPreviewList,
    };
