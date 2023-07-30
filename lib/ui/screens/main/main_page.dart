//Core Packages
import 'package:FilmFlu/network/api.dart';
import 'package:FilmFlu/ui/components/scaffold_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_svg/flutter_svg.dart';

//My Packages
import 'package:FilmFlu/dto/movie.dart';
import 'package:FilmFlu/ui/components/movie_list.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
    Api().fetchPopularMovies("day").then((value) {
      setState(() {
        movies = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
        containerChild: Container(
            color: Theme.of(context).colorScheme.background,
            child: ListView(children: [
              Row(children: [
                Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      AppLocalizations.of(context)!.film_list_title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'YsabeauInfant',
                          fontSize: 40),
                    ))
              ]),
              MovieList(items: movies),
            ])));
  }
}
