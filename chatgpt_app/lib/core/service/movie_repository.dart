import 'dart:convert';
import 'dart:io';
import 'package:chatgpt_app/core/models/movieNewPop.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  Future<T> getMovie<T>(String url, T Function(dynamic json) fromJson) async {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'accept': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZjZiNjJkNzc1MzFjZGJiNTU5ZDUzOGFkNjRmODM5YSIsInN1YiI6IjY1YjM0ZDk2YTA2NjQ1MDEyZjhkNDQ3NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AELECBs0LjnLI6AxXQUF5gJ7Q0VLvyKRNe-vVxOouo0'
      },
    );
    if (response.statusCode == 200) {
      return fromJson(json.decode(response.body));
    } else {
      throw const HttpException('Failed to load data');
    }
  }

  Future<MovieNewPop> getNewAndPopMovies() async {
    return await getMovie(
        'https://api.themoviedb.org/3/trending/movie/week?language=en-US',
        (json) {
      return MovieNewPop.fromJson(json);
    });
  }

  Future<MovieNewPop> getTopRatedMovies() async {
    return await getMovie(
        'https://api.themoviedb.org/3/movie/top_rated?language=en-US', (json) {
      return MovieNewPop.fromJson(json);
    });
  }

  Future<MovieNewPop> getNowPlayingMovies() async {
    return await getMovie(
        'https://api.themoviedb.org/3/movie/now_playing?language=en-US',
        (json) {
      return MovieNewPop.fromJson(json);
    });
  }

  Future<MovieNewPop> getUpComingMovies() async {
    return await getMovie(
        'https://api.themoviedb.org/3/movie/upcoming?language=en-US', (json) {
      return MovieNewPop.fromJson(json);
    });
  }
}
