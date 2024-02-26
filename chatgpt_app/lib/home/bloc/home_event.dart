import 'package:flutter/material.dart';

@immutable
abstract class HomeEvent {}

// Initial events
class HomeInitalEvent extends HomeEvent {}

// Search books event
class HomeSearchPromptEvent extends HomeEvent {}
