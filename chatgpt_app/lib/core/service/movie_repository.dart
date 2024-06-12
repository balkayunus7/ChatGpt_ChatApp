import 'dart:convert';
import 'dart:io';
import 'package:chatgpt_app/core/models/movie.dart';
import 'package:chatgpt_app/presentation/product/constants/string_constants.dart';
import 'package:chatgpt_app/presentation/product/enums/api_request.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  Future<Option<List<Results>>> getMovie<T>(
    String url,
    T Function(dynamic json) fromJson, {
    int pageNum = 1,
  }) async {
    final response = await http.get(
      Uri.parse('$url&page=$pageNum'),
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer ${dotenv.env['TOKEN']}',
      },
    );
    if (response.statusCode == 200) {
      return some(
        Movie.fromJson(json.decode(response.body)).results!,
      );
    } else {
      return none();
    }
  }

  HttpException customServiceException() =>
      const HttpException(StringConstants.httpException);

  // get New and Populer Movies from API
  Future<Option<List<Results>>> getNewAndPopMovies({int pageNum = 1}) async {
    return await getMovie(ApiRequest.trendWeek.url, (json) {
      return Movie.fromJson(json);
    }, pageNum: pageNum);
  }

  // get Now Playing Movies from API
  Future<Option<List<Results>>> getNowPlayingMovies({int pageNum = 1}) async {
    return await getMovie(ApiRequest.nowPlaying.url, (json) {
      return Movie.fromJson(json);
    }, pageNum: pageNum);
  }

  // get Up Coming Movies from API
  Future<Option<List<Results>>> getUpComingMovies({int pageNum = 1}) async {
    return await getMovie(ApiRequest.upComing.url, (json) {
      return Movie.fromJson(json);
    }, pageNum: pageNum);
  }

  // get Up Coming Movies from API
  Future<Option<List<Results>>> getPopulerMovies({int pageNum = 1}) async {
    return await getMovie(ApiRequest.trendWeek.url, (json) {
      return Movie.fromJson(json);
    }, pageNum: pageNum);
  }

  // get Up Coming Movies from API
  Future<Option<List<Results>>> getTopRatedMovies({int pageNum = 1}) async {
    return await getMovie(ApiRequest.topRated.url, (json) {
      return Movie.fromJson(json).results!;
    }, pageNum: pageNum);
  }
}
