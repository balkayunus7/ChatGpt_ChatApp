import 'package:flutter/material.dart';

@immutable
abstract class HomeState {}

//Initial states
class HomeInital extends HomeState {}

// Loading state and error state
class HomeLoadingState extends HomeState {
  final String textResult;
  HomeLoadingState(this.textResult);
}

class HomeErrorState extends HomeState {}

// Get favorite books state
class HomeSearchPrompt extends HomeState {}
