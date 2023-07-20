import 'dart:convert';
import 'package:FilmFlu/env/env.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:FilmFlu/dto/movie.dart';

const String baseURL = 'https://api.themoviedb.org/3';
const String imgBaseUrl = 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2';

Map<String, String>? baseHeaders = {
  'Authorization': 'Bearer ${Env.tmdbApiKey}',
  'Content-Type': 'application/json'
};

class Api {
  Movie parseMovie(String responseBody) {
    final parsed = jsonDecode(responseBody);
    return Movie.fromJson(parsed);
  }

  List<Movie> parseMovies(String responseBody) {
    final parsed = jsonDecode(responseBody)['results'];
    return parsed.map<Movie>((json) => Movie.fromJson(json)).toList();
  }

  Future<List<Movie>> fetchPopularMovies(String trendingType) async {
    final response = await http.Client().get(
        Uri.parse('$baseURL/trending/movie/$trendingType?language=es-ES'),
        headers: baseHeaders);
    return compute(parseMovies, response.body);
  }

  Future<Movie> fetchMovie(int movieId) async {
    final response = await http.Client().get(
        Uri.parse(
            '$baseURL/movie/${movieId}?language=es-ES&append_to_response=videos,credits'),
        headers: baseHeaders);
    return compute(parseMovie, response.body);
  }
}
