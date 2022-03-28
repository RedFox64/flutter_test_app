// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterDetail _$CharacterDetailFromJson(Map<String, dynamic> json) =>
    CharacterDetail(
      name: json['name'] as String,
      gender: $enumDecode(_$CharacterGenderEnumMap, json['gender']),
      image: json['image'] as String,
      status: json['status'] as String,
      episodeList: (json['episode'] as List<dynamic>)
          .map((e) => Episode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterDetailToJson(CharacterDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'gender': _$CharacterGenderEnumMap[instance.gender],
      'image': instance.image,
      'status': instance.status,
      'episode': instance.episodeList,
    };

const _$CharacterGenderEnumMap = {
  CharacterGender.female: 'Female',
  CharacterGender.male: 'Male',
  CharacterGender.genderless: 'Genderless',
  CharacterGender.unknown: 'unknown',
};
