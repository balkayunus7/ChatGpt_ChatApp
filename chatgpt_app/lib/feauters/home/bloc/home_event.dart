import 'package:flutter/material.dart';

@immutable
abstract class HomeEvent {}

// Initial events
class HomeInitalEvent extends HomeEvent {}

class HomeTopRatedInitalEvent extends HomeEvent {}

class HomePopulerInitialEvent extends HomeEvent {}

class HomeOnComingInitialEvent extends HomeEvent {}

// Detail events
class HomeTopRatedDetailEvent extends HomeEvent {
  final int pageNum;
  HomeTopRatedDetailEvent({required this.pageNum});
}

class HomePopulerDetailEvent extends HomeEvent {
  final int pageNum;
  HomePopulerDetailEvent({required this.pageNum});
}

class HomeOnComingDetailEvent extends HomeEvent {
  final int pageNum;
  HomeOnComingDetailEvent({required this.pageNum});
}
