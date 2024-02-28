import 'dart:convert';
import 'dart:io';
import 'package:chatgpt_app/core/models/movie.dart';
import 'package:chatgpt_app/product/enums/api_request.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  // get Movie from API Outline Function
  Future<T> getMovie<T>(String url, T Function(dynamic json) fromJson) async {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer ${dotenv.env['TOKEN']}',
      },
    );
    if (response.statusCode == 200) {
      return fromJson(json.decode(response.body));
    } else {
      throw const HttpException('Failed to load data');
    }
  }

  // get New and Populer Movies from API
  Future<Movie> getNewAndPopMovies() async {
    return await getMovie(ApiRequest.trendWeek.url, (json) {
      return Movie.fromJson(json);
    });
  }

  // get Top Rated Movies from API
  Future<Movie> getTopRatedMovies() async {
    return await getMovie(ApiRequest.topRated.url, (json) {
      return Movie.fromJson(json);
    });
  }

  // get Now Playing Movies from API
  Future<Movie> getNowPlayingMovies() async {
    return await getMovie(ApiRequest.nowPlaying.url, (json) {
      return Movie.fromJson(json);
    });
  }

  // get Up Coming Movies from API
  Future<Movie> getUpComingMovies() async {
    return await getMovie(ApiRequest.upComing.url, (json) {
      return Movie.fromJson(json);
    });
  }
Future<Movie> getAllMovie(int pageNum) async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=$pageNum'),
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer ${dotenv.env['TOKEN']}',
      },
    );
    if (response.statusCode == 200) {
      return Movie.fromJson(json.decode(response.body));
    } else {
      throw const HttpException('Failed to load data');
    }
  }

}
