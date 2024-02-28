import 'package:flutter/material.dart';

@immutable
abstract class HomeEvent {}

// Initial events
class HomeInitalEvent extends HomeEvent {}

class HomeTopRatedInitalEvent extends HomeEvent {}

class HomeTopRatedDetailEvent extends HomeEvent {
  final int pageNum;
  HomeTopRatedDetailEvent({required this.pageNum});
}
