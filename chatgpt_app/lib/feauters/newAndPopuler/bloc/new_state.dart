import 'package:chatgpt_app/core/models/movieNewPop.dart';
import 'package:flutter/material.dart';

@immutable
abstract class NewPopState {}

//Initial states
class NewPopInital extends NewPopState {}

class NewPopErrorState extends NewPopState {}

// Get favorite books state
class NewPopMovieState extends NewPopState {
  final MovieNewPop moviePopNewList;
  NewPopMovieState({required this.moviePopNewList});
}
