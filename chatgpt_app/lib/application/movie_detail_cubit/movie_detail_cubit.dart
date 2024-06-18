import 'package:chatgpt_app/application/movie_detail_cubit/movie_detail_state.dart';
import 'package:chatgpt_app/core/service/movie_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit() : super(MovieDetailState.initial());

  Future<void> addFetched(int index) async {
    final movie = await MovieRepository().getMovieDetails(index);
    emit(
      state.copyWith(
        movie: movie,
      ),
    );
  }
}
