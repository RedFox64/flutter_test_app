import 'package:json_annotation/json_annotation.dart';
part 'info_response.g.dart';

@JsonSerializable()
class InfoResponce {
  @JsonKey(name: 'next')
  final int? nextPage;
  InfoResponce({
    this.nextPage,
  });

  factory InfoResponce.fromJson(Map<String, dynamic> json) =>
      _$InfoResponceFromJson(json);

  Map<String, dynamic> toJson() => _$InfoResponceToJson(this);
}
