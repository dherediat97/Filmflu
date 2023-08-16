import 'package:FilmFlu/dto/movie.dart';
import 'package:FilmFlu/ui/components/movie_carrousel_item.dart';
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key, required this.movies});

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: ClampingScrollPhysics(),
      controller: ScrollController(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.7,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return Builder(
                  builder: (BuildContext context) {
                    return MovieCarrouselItem(movie: movies[index]);
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
