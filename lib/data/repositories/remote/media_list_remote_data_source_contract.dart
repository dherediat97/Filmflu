import 'package:FilmFlu/data/models/media_item_remote_entity.dart';

abstract class MediaListRemoteDataSourceContract {
  Future<List<MediaItemRemoteEntity>> getMediaTypeList(String mediaType);
}
