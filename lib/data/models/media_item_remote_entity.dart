import 'package:film_flu/core/entities/pagination.dart';
import 'package:film_flu/data/models/credits_media_remote_entity.dart';
import 'package:film_flu/domain/models/genre_entity.dart';
import 'package:film_flu/domain/models/media_item_entity.dart';
import 'package:film_flu/domain/models/video_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_item_remote_entity.freezed.dart';
part 'media_item_remote_entity.g.dart';

@freezed
class MediaItemRemoteEntity with _$MediaItemRemoteEntity {
  const factory MediaItemRemoteEntity({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genres') List<GenreEntity>? genres,
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_title') String? originalTitle,
    @JsonKey(name: 'popularity') double? popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'media_type') String? mediaType,
    @JsonKey(name: 'release_date') String? releaseDate,
    @JsonKey(name: 'first_air_date') String? firstAirDate,
    @JsonKey(name: 'videos') Pagination<VideoEntity>? videos,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
    @JsonKey(name: 'overview') String? overview,
    @JsonKey(name: 'runtime') int? runtime,
    @JsonKey(name: 'credits') CreditsMediaRemoteEntity? credits,
  }) = _MediaItemRemoteEntity;

  factory MediaItemRemoteEntity.fromJson(Map<String, dynamic> json) =>
      _$MediaItemRemoteEntityFromJson(json);
}

extension MediaItemToRemoteEntityExtension on MediaItemRemoteEntity {
  MediaItemEntity toMediaEntity() => MediaItemEntity(
        title: title ?? '',
        name: name ?? '',
        id: id,
        popularity: popularity ?? 0.0,
        posterPath: posterPath ?? '',
        voteAverage: voteAverage ?? 0,
        voteCount: voteCount ?? 0,
        backdropPath: backdropPath ?? '',
        credits: credits?.toCreditsEntity(),
        genres: genres ?? [],
        mediaType: mediaType ?? '',
        firstAirDate: firstAirDate ?? '',
        originalLanguage: originalLanguage ?? '',
        originalTitle: originalTitle ?? '',
        overview: overview ?? '',
        releaseDate: releaseDate ?? '',
        runtime: runtime ?? 0,
        videos: videos,
      );
}
