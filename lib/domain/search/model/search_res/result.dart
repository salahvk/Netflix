import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  Result({
    this.id,
    this.originalTitle,
    this.posterPath,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
