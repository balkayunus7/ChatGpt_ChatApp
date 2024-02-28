import 'dart:async';
import 'package:chatgpt_app/core/service/movie_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInital()) {
    on<HomeInitalEvent>(homeInitalEvent);
    on<HomeTopRatedInitalEvent>(homeTopRatedInitalEvent);
    on<HomeTopRatedDetailEvent>(homeTopRatedDetailEvent);
  }

  // Search operations
  Future<void> homeInitalEvent(
      HomeInitalEvent event, Emitter<HomeState> emit) async {
    emit(HomeInital());
    final movieUpComingwList = await MovieRepository().getUpComingMovies();
    final movieTopRatedList = await MovieRepository().getTopRatedMovies();
    final moviePopulerList = await MovieRepository().getNewAndPopMovies();
    final movieNowPlayingList = await MovieRepository().getNowPlayingMovies();

    emit(HomeMovieDatasState(
        movieNowPlayingList: movieNowPlayingList,
        movieUpComingwList: movieUpComingwList,
        movieTopRatedList: movieTopRatedList,
        moviePopulerList: moviePopulerList));
  }

  Future<FutureOr<void>> homeTopRatedInitalEvent(
      HomeTopRatedInitalEvent event, Emitter<HomeState> emit) async {
    emit(TopRatedInitial());
    final movieDetail = await MovieRepository().getTopRatedMovies();
    emit(HomeMovieAllTopratedState(movieDetail: movieDetail));
  }

  Future<FutureOr<void>> homeTopRatedDetailEvent(
      HomeTopRatedDetailEvent event, Emitter<HomeState> emit) async {
    final movieDetail = await MovieRepository().getAllMovie(event.pageNum);
    emit(HomeMovieAllTopratedState(movieDetail: movieDetail));
  }
}
