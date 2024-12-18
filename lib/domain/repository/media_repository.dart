import 'package:film_flu/app/types/result.dart';
import 'package:film_flu/data/datasources/remote/api/filmflu_api.dart';
import 'package:film_flu/data/repositories/media_repository_impl.dart';
import 'package:film_flu/domain/models/credits_media_entity.dart';
import 'package:film_flu/domain/models/media_item_entity.dart';
import 'package:film_flu/domain/models/media_response_entity.dart';
import 'package:film_flu/domain/models/media_simple_item_entity.dart';
import 'package:film_flu/domain/models/review_entity.dart';
import 'package:film_flu/presentation/features/bottom_app_bar/bloc/home_bloc.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'media_repository.g.dart';

@riverpod
MediaRepository mediaRepository(ref) => MediaRepositoryImpl(
      ref.watch(filmfluApiClientProvider),
    );

abstract interface class MediaRepository {
  Future<MediaItemEntity> getMediaItem({
    required MediaType mediaTypeSelected,
    required String mediaTypeId,
  });

  Future<Result<CreditsMediaEntity>> getCredits({
    required MediaType mediaTypeSelected,
    required String mediaTypeId,
  });

  Future<Result<List<ReviewEntity>?>> getReviews({
    required MediaType mediaTypeSelected,
    required String mediaTypeId,
  });

  Future<Result<MediaResponseEntity>> getMedia({
    required MediaType mediaTypeSelected,
    required String mediaTypeId,
  });

  Future<(int totalItems, List<MediaSimpleItemEntity> items)>
      getMediaDataByGenre({
    required MediaType mediaTypeSelected,
    required int genreId,
    required String languageId,
  });

  Future<(int totalItems, List<MediaSimpleItemEntity> items)> getMovies({
    required int genreId,
    String languageId,
  });

  Future<(int totalItems, List<MediaSimpleItemEntity> items)> getTVSeries({
    required int genreId,
    String languageId,
  });

  // Future<Result<List<MediaSimpleItemEntity>>> paginateMediaData({
  //   required MediaType mediaTypeSelected,
  //   required int page,
  //   required int genreId,
  // });

  Future<Result<List<MediaItemEntity>>> searchMediaData({
    required MediaType mediaTypeSelected,
    required String query,
  });

  Future<Result<MediaItemEntity?>> getMediaDataDay({
    required MediaType mediaTypeSelected,
  });
}
