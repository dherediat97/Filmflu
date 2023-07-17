import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:FilmFlu/env/env.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:FilmFlu/dto/movie.dart';

const String baseURL = 'https://api.themoviedb.org/3';
const String imgBaseUrl = 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2';

Map<String, dynamic> baseHeaders = {
  'Authorization': 'Bearer ${Env.tmdbApiKey}',
  'Content-Type': 'application/json'
};

class Api {
  final _dio = Dio();

  Api() {
    _dio.options = BaseOptions(
      baseUrl: baseURL,
      headers: baseHeaders,
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000),
    );
    initializeInterceptors();
  }

  initializeInterceptors() {
    _dio.interceptors.add(PrettyDioLogger(
      requestBody: false,
      responseBody: true,
      responseHeader: false,
      compact: true,
    ));
  }

  Movie parseMovie(String responseBody) {
    final parsed = jsonDecode(responseBody);
    print("parse=$parsed");
    final movie = Movie.fromJson(parsed);
    print("movie=$movie");
    return movie;
  }

  List<Movie> parseMovies(String responseBody) {
    final parsed = jsonDecode(responseBody)['results'];
    return parsed.map<Movie>((json) => Movie.fromJson(json)).toList();
  }

  Future<List<Movie>> fetchPopularMovies() async {
    final response = await http.Client().get(
        Uri.parse('$baseURL/trending/movie/day?language=es-ES'),
        headers: {'Authorization': 'Bearer ${Env.tmdbApiKey}'});
    return compute(parseMovies, response.body);
  }

  Future<Movie> getMovie(int movieId) async {
    final response = await http.Client().get(
        Uri.parse('$baseURL/movie/${movieId}?language=es-ES'),
        headers: {'Authorization': 'Bearer ${Env.tmdbApiKey}'});
    return compute(parseMovie, response.body);
  }
}
