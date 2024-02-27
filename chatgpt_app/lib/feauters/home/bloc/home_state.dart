import 'package:flutter/material.dart';

import '../../../core/models/movieNewPop.dart';

@immutable
abstract class HomeState {}

//Initial states
class HomeInital extends HomeState {}

class HomeMovieDatasState extends HomeState {
  final MovieNewPop movieUpComingwList;
  final MovieNewPop movieTopRatedList;
  final MovieNewPop moviePopulerList;
  HomeMovieDatasState(
      {required this.movieUpComingwList,
      required this.movieTopRatedList,
      required this.moviePopulerList});
}

class HomeErrorState extends HomeState {}
