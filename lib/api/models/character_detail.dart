import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/api/models/character_gender.dart';
import 'package:test_app/api/models/episode.dart';

part 'character_detail.g.dart';

@JsonSerializable()
class CharacterDetail {
  final String name;
  final CharacterGender gender;
  final String image;
  final String status;
  @JsonKey(name: 'episode')
  final List<Episode> episodeList;

  CharacterDetail({
    required this.name,
    required this.gender,
    required this.image,
    required this.status,
    required this.episodeList,
  });

  factory CharacterDetail.fromJson(Map<String, dynamic> json) =>
      _$CharacterDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterDetailToJson(this);
}
