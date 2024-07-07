import 'package:auto_size_text/auto_size_text.dart';
import 'package:film_flu/app/extensions/localizations_extensions.dart';
import 'package:film_flu/presentation/features/media_list/bloc/media_list_bloc.dart';
import 'package:film_flu/presentation/features/media_list/widgets/media_carrousel_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MediaList extends StatefulWidget {
  const MediaList({
    super.key,
  });

  @override
  State<MediaList> createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  @override
  void initState() {
    super.initState();
    context.read<MediaListBloc>().add(const MediaListEvent.getMediaData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaListBloc, MediaListState>(
      builder: (context, state) {
        return state.uiState.when(
          initial: () => Container(),
          error: (error) => Container(),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          success: () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              AutoSizeText(context.localizations.action_movies,
                  maxFontSize: 30,
                  minFontSize: 20,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 40,
                  )),
              const SizedBox(height: 20),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.mediaData?.actionMovies.length,
                  itemBuilder: (context, index) {
                    return MovieCarrouselItem(
                        movie: state.mediaData!.actionMovies[index]);
                  },
                ),
              ),
              const SizedBox(height: 20),
              AutoSizeText(context.localizations.anime_series,
                  maxFontSize: 30,
                  minFontSize: 20,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 40,
                  )),
              const SizedBox(height: 20),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.mediaData?.animeSeries.length,
                  itemBuilder: (context, index) {
                    return MovieCarrouselItem(
                        movie: state.mediaData!.animeSeries[index]);
                  },
                ),
              ),
              AutoSizeText(context.localizations.animation_series,
                  maxFontSize: 30,
                  minFontSize: 20,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 40,
                  )),
              const SizedBox(height: 20),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.mediaData?.animationSeries.length,
                  itemBuilder: (context, index) {
                    return MovieCarrouselItem(
                        movie: state.mediaData!.animationSeries[index]);
                  },
                ),
              ),
              const SizedBox(height: 20),
              AutoSizeText(context.localizations.fiction_movies,
                  maxFontSize: 30,
                  minFontSize: 20,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 40,
                  )),
              const SizedBox(height: 20),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.mediaData?.fictionMovies.length,
                  itemBuilder: (context, index) {
                    return MovieCarrouselItem(
                        movie: state.mediaData!.fictionMovies[index]);
                  },
                ),
              ),
              const SizedBox(height: 20),
              AutoSizeText(context.localizations.love_movies,
                  maxFontSize: 30,
                  minFontSize: 20,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 40,
                  )),
              const SizedBox(height: 20),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.mediaData?.romanceMovies.length,
                  itemBuilder: (context, index) {
                    return MovieCarrouselItem(
                        movie: state.mediaData!.romanceMovies[index]);
                  },
                ),
              ),
              const SizedBox(height: 20),
              AutoSizeText(context.localizations.comedy_movies,
                  maxFontSize: 30,
                  minFontSize: 20,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 40,
                  )),
              const SizedBox(height: 20),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.mediaData?.comedyMovies.length,
                  itemBuilder: (context, index) {
                    return MovieCarrouselItem(
                        movie: state.mediaData!.comedyMovies[index]);
                  },
                ),
              ),
              const SizedBox(height: 20),
              AutoSizeText(context.localizations.thriller_movies,
                  maxFontSize: 30,
                  minFontSize: 20,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 40,
                  )),
              const SizedBox(height: 20),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.mediaData?.suspenseMovies.length,
                  itemBuilder: (context, index) {
                    return MovieCarrouselItem(
                        movie: state.mediaData!.suspenseMovies[index]);
                  },
                ),
              ),
              const SizedBox(height: 20),
              AutoSizeText(context.localizations.documental_series,
                  maxFontSize: 30,
                  minFontSize: 20,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 40,
                  )),
              const SizedBox(height: 20),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.mediaData?.documentalSeries.length,
                  itemBuilder: (context, index) {
                    return MovieCarrouselItem(
                        movie: state.mediaData!.documentalSeries[index]);
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
