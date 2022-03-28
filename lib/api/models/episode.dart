import 'package:json_annotation/json_annotation.dart';
part 'episode.g.dart';

@JsonSerializable()
class Episode {
  final String id;
  final String name;
  final String episode;

  Episode({
    required this.id,
    required this.name,
    required this.episode,
  });

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}
