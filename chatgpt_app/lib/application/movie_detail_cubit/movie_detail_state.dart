import 'package:equatable/equatable.dart';
import '../../core/models/movie.dart';

final class MovieDetailState extends Equatable {
  const MovieDetailState({
    required this.movie,
  });

  factory MovieDetailState.initial() {
    return MovieDetailState(
      movie: Results(),
    );
  }

  final Results movie;

  @override
  List<Object> get props => [
        movie,
      ];

  MovieDetailState copyWith({
    Results? movie,
  }) {
    return MovieDetailState(
      movie: movie ?? this.movie,
    );
  }
}
