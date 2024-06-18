import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/models/movie.dart';

final class HomeState extends Equatable {
  const HomeState({
    required this.movieTopRatedList,
    required this.movieOnComingList,
    required this.moviePopulerList,
    required this.movieNowPlayingList,
  });

  factory HomeState.initial() {
    return HomeState(
      movieTopRatedList: none(),
      movieOnComingList: none(),
      moviePopulerList: none(),
      movieNowPlayingList: none(),
    );
  }

  final Option<List<Results>> movieTopRatedList;
  final Option<List<Results>> movieOnComingList;
  final Option<List<Results>> moviePopulerList;
  final Option<List<Results>> movieNowPlayingList;
  
  bool get isLoading =>
      movieNowPlayingList.isNone() ||
      movieTopRatedList.isNone() ||
      movieOnComingList.isNone() ||
      moviePopulerList.isNone();

  @override
  List<Object> get props => [
        movieTopRatedList,
        movieOnComingList,
        moviePopulerList,
        movieNowPlayingList,
      ];

  HomeState copyWith({
    Option<List<Results>>? movieTopRatedList,
    Option<List<Results>>? movieOnComingList,
    Option<List<Results>>? moviePopulerList,
    Option<List<Results>>? movieNowPlayingList,
  }) {
    return HomeState(
      movieTopRatedList: movieTopRatedList ?? this.movieTopRatedList,
      movieOnComingList: movieOnComingList ?? this.movieOnComingList,
      moviePopulerList: moviePopulerList ?? this.moviePopulerList,
      movieNowPlayingList: movieNowPlayingList ?? this.movieNowPlayingList,
    );
  }
}

class ErrorDetails {
  final String message;

  ErrorDetails(this.message);

  @override
  String toString() => message;
}
