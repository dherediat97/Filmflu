import 'package:film_flu/app/extensions/localizations_extensions.dart';
import 'package:film_flu/domain/models/actor_entity.dart';
import 'package:film_flu/domain/models/film_worker_entity.dart';
import 'package:film_flu/domain/models/review_entity.dart';
import 'package:film_flu/presentation/features/media_details/bloc/media_detail_bloc.dart';
import 'package:film_flu/presentation/features/media_details/widgets/actor_worker_item.dart';
import 'package:film_flu/presentation/features/media_details/widgets/background_image_media_item.dart';
import 'package:film_flu/presentation/features/media_details/widgets/film_worker_item.dart';
import 'package:film_flu/presentation/widgets/container_tab_media_item.dart';
import 'package:film_flu/presentation/features/media_details/widgets/reviews_widget_item.dart';
import 'package:film_flu/presentation/features/media_list/constants/media_list_constants.dart';
import 'package:film_flu/presentation/widgets/empty_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailTabMediaItem extends StatefulWidget {
  const DetailTabMediaItem({
    super.key,
    required this.mediaItemType,
    required this.mediaItemId,
  });

  final String mediaItemType;
  final int mediaItemId;

  @override
  State<DetailTabMediaItem> createState() => _DetailTabMediaItem();
}

class _DetailTabMediaItem extends State<DetailTabMediaItem>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(
      () {
        var index = _tabController.index;
        switch (index) {
          case 0:
            break;
          case 1:
            context.read<MediaDetailBloc>().add(
                  MediaDetailEvent.getReviews(
                    widget.mediaItemType,
                    widget.mediaItemId,
                  ),
                );
            break;
          case 2:
            context.read<MediaDetailBloc>().add(
                  MediaDetailEvent.getCredits(
                    widget.mediaItemType,
                    widget.mediaItemId,
                  ),
                );
            break;
          case 3:
            context.read<MediaDetailBloc>().add(
                  MediaDetailEvent.getCredits(
                    widget.mediaItemType,
                    widget.mediaItemId,
                  ),
                );
            break;
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaDetailBloc, MediaDetailState>(
      builder: (context, state) {
        bool isMovie =
            widget.mediaItemType == MediaListConstants.movieMediaType;

        return SingleChildScrollView(
          child: Column(
            children: [
              BackgroundImageMediaItem(
                mediaItem: state.mediaItem,
                movieName: state.movieName,
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: DefaultTabController(
                  length: 4,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TabBar(
                        controller: _tabController,
                        tabs: [
                          Tab(
                            text: isMovie
                                ? context.localizations.about_movie
                                : context.localizations.about_serie,
                          ),
                          Tab(text: context.localizations.reviews),
                          Tab(text: context.localizations.character_cast),
                          Tab(text: context.localizations.production_cast),
                        ],
                      ),
                      SizedBox(
                        height: 500,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            ContainerTabMediaItem(
                              state: state.uiState,
                              item: state.mediaItem?.overview,
                              child: Text(
                                state.mediaItem!.overview.toString(),
                                textAlign: TextAlign.start,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            ContainerTabMediaItem(
                              state: state.uiState,
                              item: state.reviews,
                              child: state.reviews == null
                                  ? ListView.builder(
                                      itemCount: state.reviews?.length,
                                      itemBuilder: (context, index) {
                                        ReviewEntity? review =
                                            state.reviews?[index];

                                        return ReviewsWidgetItem(
                                          review: review,
                                        );
                                      },
                                    )
                                  : const EmptyStateWidget(
                                      errorMessage:
                                          'No se han encontrado reseñas'),
                            ),
                            ContainerTabMediaItem(
                              state: state.uiState,
                              item: state.credits?.cast,
                              child: GridView.custom(
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 240,
                                  mainAxisExtent: 340,
                                  mainAxisSpacing: 18,
                                  crossAxisSpacing: 18,
                                ),
                                childrenDelegate: SliverChildBuilderDelegate(
                                  childCount: state.credits?.cast.length,
                                  (_, index) {
                                    ActorEntity? actor =
                                        state.credits?.cast[index];

                                    return FilmActorItem(
                                      actor: actor,
                                    );
                                  },
                                ),
                              ),
                            ),
                            ContainerTabMediaItem(
                              state: state.uiState,
                              item: state.credits?.crew,
                              child: GridView.custom(
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 240,
                                  mainAxisExtent: 340,
                                  mainAxisSpacing: 18,
                                  crossAxisSpacing: 18,
                                ),
                                childrenDelegate: SliverChildBuilderDelegate(
                                  childCount: state.credits?.crew.length,
                                  (_, index) {
                                    FilmWorkerEntity? filmWorker =
                                        state.credits?.crew[index];

                                    return FilmWorkerItem(
                                      filmWorker: filmWorker,
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
