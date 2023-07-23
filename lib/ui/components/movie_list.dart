import 'package:FilmFlu/dto/movie.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:FilmFlu/ui/components/movie_carrousel_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key, required this.items});

  final List<Movie> items;

  final aspectRatio = kIsWeb ? 16 / 9 : 1.5;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: items.map((item) {
          return Builder(builder: (BuildContext context) {
            return MovieCarrouselItem(movie: item);
          });
        }).toList(),
        options: CarouselOptions(
          viewportFraction: 0.6,
          height: MediaQuery.of(context).size.height / 2,
          aspectRatio: aspectRatio,
        ));
  }
}
