import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/api/models/character_gender.dart';

part 'character_preview.g.dart';

@JsonSerializable()
class CharacterPreview {
  final String id;
  final String name;
  final CharacterGender gender;
  final String image;

  CharacterPreview({
    required this.id,
    required this.name,
    required this.gender,
    required this.image,
  });

  factory CharacterPreview.fromJson(Map<String, dynamic> json) =>
      _$CharacterPreviewFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterPreviewToJson(this);
}
