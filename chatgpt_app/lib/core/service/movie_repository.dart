import 'dart:convert';
import 'dart:io';
import 'package:chatgpt_app/core/models/movie.dart';
import 'package:chatgpt_app/product/constants/string_constants.dart';
import 'package:chatgpt_app/product/enums/api_request.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  // get Movie from API Outline Function
  Future<T> getMovie<T>(
      String url, T Function(dynamic json) fromJson, int pageNum) async {
    final response = await http.get(
      Uri.parse('$url&page=$pageNum'),
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer ${dotenv.env['TOKEN']}',
      },
    );
    if (response.statusCode == 200) {
      return fromJson(json.decode(response.body));
    } else {
      throw customServiceException();
    }
  }

  Future<List<Results>> getMovieRandom() async {
    final response = await http.get(
      Uri.parse(ApiRequest.trendWeek.url),
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer ${dotenv.env['TOKEN']}',
      },
    );
    if (response.statusCode == 200) {
      return Movie.fromJson(json.decode(response.body)).results!;
    } else {
      throw customServiceException();
    }
  }

  HttpException customServiceException() =>
      const HttpException(StringConstants.httpException);

  // get New and Populer Movies from API
  Future<Movie> getNewAndPopMovies(int pageNum) async {
    return await getMovie(ApiRequest.trendWeek.url, (json) {
      return Movie.fromJson(json);
    }, pageNum);
  }

  // get Now Playing Movies from API
  Future<Movie> getNowPlayingMovies(int pageNum) async {
    return await getMovie(ApiRequest.nowPlaying.url, (json) {
      return Movie.fromJson(json);
    }, pageNum);
  }

  // get Up Coming Movies from API
  Future<Movie> getUpComingMovies(int pageNum) async {
    return await getMovie(ApiRequest.upComing.url, (json) {
      return Movie.fromJson(json);
    }, pageNum);
  }

  // get Up Coming Movies from API
  Future<Movie> getPopulerMovies(int pageNum) async {
    return await getMovie(ApiRequest.trendWeek.url, (json) {
      return Movie.fromJson(json);
    }, pageNum);
  }

  // get Up Coming Movies from API
  Future<Movie> getTopRatedMovies(int pageNum) async {
    return await getMovie(ApiRequest.topRated.url, (json) {
      return Movie.fromJson(json);
    }, pageNum);
  }

}
