import 'package:FilmFlu/ui/components/fast_movie_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:FilmFlu/dto/movie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:FilmFlu/network/api.dart';

class MovieCarrouselItem extends StatelessWidget {
  const MovieCarrouselItem({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            showDragHandle: true,
            enableDrag: true,
            useSafeArea: true,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(48))),
            constraints: BoxConstraints.expand(
                width: kIsWeb
                    ? MediaQuery.of(context).size.width
                    : MediaQuery.of(context).size.width,
                height: kIsWeb
                    ? MediaQuery.of(context).size.height / 1.4
                    : MediaQuery.of(context).size.height / 2),
            isDismissible: true,
            context: context,
            builder: (context) => DraggableScrollableSheet(
              expand: false,
              initialChildSize: 1.0,
              maxChildSize: 1.0,
              minChildSize: 0.25,
              builder: (context, scrollController) => SingleChildScrollView(
                controller: scrollController,
                child: FastMovieDetails(movieId: movie.id),
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                  '$movieImgBaseURL${movie.posterPath}'),
            ),
          ),
        ),
      ),
    );
  }
}
