import 'package:flutter/material.dart';
import '../../../core/models/movie.dart';

@immutable
abstract class HomeState {}

//Initial states
class HomeInital extends HomeState {}

class TopRatedInitial extends HomeState {}

class HomeMovieDatasState extends HomeState {
  final Movie movieUpComingwList;
  final Movie movieTopRatedList;
  final Movie moviePopulerList;
  final Movie movieNowPlayingList;
  HomeMovieDatasState(
      {required this.movieUpComingwList,
      required this.movieNowPlayingList,
      required this.movieTopRatedList,
      required this.moviePopulerList});
}

class HomeMovieAllTopratedState extends HomeState {
  final Movie movieDetail;
  HomeMovieAllTopratedState({required this.movieDetail});
}

class HomeErrorState extends HomeState {}
