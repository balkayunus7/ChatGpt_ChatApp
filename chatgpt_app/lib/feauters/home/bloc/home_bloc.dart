import 'dart:async';
import 'package:chatgpt_app/core/service/movie_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInital()) {
    on<HomeInitalEvent>(homeInitalEvent);
  }

  // Search operations
  Future<void> homeInitalEvent(
      HomeInitalEvent event, Emitter<HomeState> emit) async {
    emit(HomeInital());
    final movieUpComingwList = await MovieRepository().getUpComingMovies();
    final movieTopRatedList = await MovieRepository().getTopRatedMovies();
    final moviePopulerList = await MovieRepository().getNewAndPopMovies();

    emit(HomeMovieDatasState(
        movieUpComingwList: movieUpComingwList,
        movieTopRatedList: movieTopRatedList,
        moviePopulerList: moviePopulerList));
  }
}
