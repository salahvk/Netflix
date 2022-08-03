// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchRes _$SearchResFromJson(Map<String, dynamic> json) => SearchRes(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchResToJson(SearchRes instance) => <String, dynamic>{
      'results': instance.results,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: json['id'] as int?,
      originalTitle: json['original_title'] as String?,
      posterPath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'original_title': instance.originalTitle,
      'poster_path': instance.posterPath,
    };
