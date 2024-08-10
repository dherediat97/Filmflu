import 'package:film_flu/app/types/ui_state.dart';
import 'package:film_flu/domain/models/media_item_entity.dart';
import 'package:film_flu/domain/repository_contracts/media_list_repository_contract.dart';
import 'package:film_flu/presentation/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_list_event.dart';
part 'media_list_state.dart';
part 'media_list_bloc.freezed.dart';

class MediaListBloc extends Bloc<MediaListEvent, MediaListState> {
  final MediaListRepositoryContract _repository;

  MediaListBloc({
    required MediaListRepositoryContract repositoryContract,
  })  : _repository = repositoryContract,
        super(MediaListState.initial()) {
    on<MediaListEvent>(
      (event, emit) async {
        await event.when(
          searchMediaData: (query) => _searchMediaData(event, emit, query),
          getMediaDataByGenre: (categorySelected, genreId, languageId) =>
              _getMediaDataByGenreId(
                  event, emit, genreId, categorySelected, languageId),
          nextPage: (page, categorySelected, genreId) =>
              _nextPage(event, emit, page, categorySelected, genreId),
        );
      },
    );
  }

  Future<void> _getMediaDataByGenreId(
    MediaListEvent event,
    Emitter<MediaListState> emit,
    int genreId,
    MediaType categorySelected,
    String languageId,
  ) async {
    emit(state.copyWith(uiState: const UiState.loading()));
    final mediaData = await _repository.getMediaDataByGenre(
      categorySelected,
      genreId,
      languageId,
    );
    mediaData.when(
      failure: (errorMessage) {
        emit(state.copyWith(uiState: const UiState.error()));
      },
      success: (value) {
        final Map<int, List<MediaItemEntity>> movieMap = {
          if (state.mediaData != null) ...state.mediaData!.movieDataByGenre,
          ...{genreId: value}
        };
        final Map<int, List<MediaItemEntity>> serieMap = {
          if (state.mediaData != null) ...state.mediaData!.serieDataByGenre,
          ...{genreId: value}
        };
        final mediaData =
            MediaData(movieDataByGenre: movieMap, serieDataByGenre: serieMap);
        emit(
          state.copyWith(
            uiState: genreId == 37
                ? const UiState.success()
                : const UiState.loading(),
            mediaData: mediaData,
          ),
        );
      },
    );
  }

  Future<void> _nextPage(
    MediaListEvent event,
    Emitter<MediaListState> emit,
    int page,
    MediaType mediaTypeSelected,
    int genreId,
  ) async {
    final movieData = await _repository.paginateMediaData(
      mediaTypeSelected: mediaTypeSelected,
      page: page,
      genreId: genreId,
    );
    movieData.when(
      failure: (errorMessage) {
        emit(state.copyWith(uiState: const UiState.error()));
      },
      success: (value) {
        final Map<int, List<MediaItemEntity>> movieMap = {
          if (state.mediaData != null) ...state.mediaData!.movieDataByGenre,
          ...{genreId: value}
        };
        final Map<int, List<MediaItemEntity>> serieMap = {
          if (state.mediaData != null) ...state.mediaData!.serieDataByGenre,
          ...{genreId: value}
        };
        final mediaData =
            MediaData(movieDataByGenre: movieMap, serieDataByGenre: serieMap);
        emit(state.copyWith(
          uiState: const UiState.success(),
          mediaData: mediaData,
        ));
      },
    );
  }

  Future<void> _searchMediaData(
    MediaListEvent event,
    Emitter<MediaListState> emit,
    String query,
  ) async {
    Future.delayed(const Duration(milliseconds: 2000));
    final movieData = await _repository.searchMediaData(
      mediaTypeSelected: MediaType.movie,
      query: query,
    );
    movieData.when(
      failure: (errorMessage) {
        emit(
          state.copyWith(),
        );
      },
      success: (value) {
        emit(
          state.copyWith(
            mediaSearchedList: value,
            uiState: const UiState.success(),
          ),
        );
      },
    );
  }
}
