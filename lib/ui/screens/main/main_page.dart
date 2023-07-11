import 'package:FilmFlu/dto/tv_show.dart';
import 'package:flutter/material.dart';

import '../../../dto/movie.dart';
import '../../../network/api.dart';
import '../../components/movie_list.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Api api = Api();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        appBar: AppBar(
            elevation: 24,
            backgroundColor: Theme.of(context).colorScheme.primary,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () => Navigator.pushNamed(context, '/login'),
                  icon: const Icon(
                    Icons.login,
                    color: Colors.white,
                  )),
            ],
            title: TextField(
              controller: _searchController,
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                hintText: 'Busca aquí tu película favorita...',
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
              ),
              onChanged: (value) {},
            )),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    'Películas populares hoy',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ],
              ),
              FutureBuilder<List<Movie>>(
                  future: api.fetchPopularMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center();
                    } else if (snapshot.hasData) {
                      return MovieList(items: snapshot.data!);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              const Row(
                children: [
                  Text(
                    'Programas TV populares hoy',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ],
              ),
              FutureBuilder<List<TvShow>>(
                  future: api.fetchPopularTvShows(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center();
                    } else if (snapshot.hasData) {
                      return MovieList(items: snapshot.data!);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ],
          ),
        ));
  }
}
