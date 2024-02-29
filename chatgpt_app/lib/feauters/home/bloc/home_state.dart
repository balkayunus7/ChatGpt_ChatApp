import 'package:flutter/material.dart';
import '../../../core/models/movie.dart';

@immutable
abstract class HomeState {}

//Initial states
class HomeInital extends HomeState {}

class TopRatedInitial extends HomeState {}

class PopulerInitial extends HomeState {}

class OnComingInitial extends HomeState {}

// Home Page Data States
class HomeMovieDatasState extends HomeState {
  final Movie movieUpComingwList;
  final List<Results> movieTopRatedList;
  final Movie moviePopulerList;
  final Movie movieNowPlayingList;
  HomeMovieDatasState(
      {required this.movieUpComingwList,
      required this.movieNowPlayingList,
      required this.movieTopRatedList,
      required this.moviePopulerList});
}

// Top Rated Page All Toprated States
class HomeMovieAllTopratedState extends HomeState {
  final List<Results> movieDetail;
  HomeMovieAllTopratedState({required this.movieDetail});
}

// Populer Page All Populer States
class HomeMovieAllPopulerState extends HomeState {
  final List<Results> movieDetail;
  HomeMovieAllPopulerState({required this.movieDetail});
}

class HomeMovieAllOnComingState extends HomeState {
  final List<Results> movieDetail;
  HomeMovieAllOnComingState({required this.movieDetail});
}

class HomeErrorState extends HomeState {}
