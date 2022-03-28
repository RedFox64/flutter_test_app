import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/api/models/character_preview.dart';
import 'package:test_app/api/models/info_response.dart';

part 'character_preview_list.g.dart';

@JsonSerializable()
class CharacterPreviewList {
  @JsonKey(name: 'info')
  final InfoResponce info;
  @JsonKey(name: 'results')
  final List<CharacterPreview> characterPreviewList;

  CharacterPreviewList({
    required this.info,
    required this.characterPreviewList,
  });

  factory CharacterPreviewList.fromJson(Map<String, dynamic> json) =>
      _$CharacterPreviewListFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterPreviewListToJson(this);
}
