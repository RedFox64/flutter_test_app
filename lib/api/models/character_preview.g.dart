// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterPreview _$CharacterPreviewFromJson(Map<String, dynamic> json) =>
    CharacterPreview(
      id: json['id'] as String,
      name: json['name'] as String,
      gender: $enumDecode(_$CharacterGenderEnumMap, json['gender']),
      image: json['image'] as String,
    );

Map<String, dynamic> _$CharacterPreviewToJson(CharacterPreview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': _$CharacterGenderEnumMap[instance.gender],
      'image': instance.image,
    };

const _$CharacterGenderEnumMap = {
  CharacterGender.female: 'Female',
  CharacterGender.male: 'Male',
  CharacterGender.genderless: 'Genderless',
  CharacterGender.unknown: 'unknown',
};
