import 'package:FilmFlu/app/types/result.dart';
import 'package:FilmFlu/domain/models/credits_media_entity.dart';
import 'package:FilmFlu/domain/models/media_item_entity.dart';

abstract class MediaRepositoryContract {
  Future<Result<MediaItemEntity>> getMediaItem(
    String mediaType,
    String mediaTypeId,
  );
  Future<Result<CreditsMediaEntity>> getCredits(
    String mediaType,
    String mediaTypeId,
  );
}
