import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/models/movie.dart';

final class HomeState extends Equatable {
  const HomeState({
    required this.movieTopRatedList,
    required this.movieUpComingList,
    required this.moviePopulerList,
    required this.movieNowPlayingList,
  });

  factory HomeState.initial() {
    return HomeState(
      movieTopRatedList: none(),
      movieUpComingList: none(),
      moviePopulerList: none(),
      movieNowPlayingList: none(),
    );
  }

  final Option<List<Results>> movieTopRatedList;
  final Option<List<Results>> movieUpComingList;
  final Option<List<Results>> moviePopulerList;
  final Option<List<Results>> movieNowPlayingList;

  @override
  List<Object> get props => [
        movieTopRatedList,
        movieUpComingList,
        moviePopulerList,
        movieNowPlayingList,
      ];

  HomeState copyWith({
    Option<List<Results>>? movieTopRatedList,
    Option<List<Results>>? movieUpComingList,
    Option<List<Results>>? moviePopulerList,
    Option<List<Results>>? movieNowPlayingList,
  }) {
    return HomeState(
      movieTopRatedList: movieTopRatedList ?? this.movieTopRatedList,
      movieUpComingList: movieUpComingList ?? this.movieUpComingList,
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
