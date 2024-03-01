import 'dart:async';
import 'package:chatgpt_app/core/service/movie_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/models/movie.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInital()) {
    on<HomeInitalEvent>(homeInitalEvent);
    on<HomeTopRatedInitalEvent>(homeTopRatedInitalEvent);
    on<HomeTopRatedDetailEvent>(homeTopRatedDetailEvent);
    on<HomePopulerInitialEvent>(homePopulerInitialEvent);
    on<HomePopulerDetailEvent>(homePopulerDetailEvent);
    on<HomeOnComingInitialEvent>(homeOnComingInitialEvent);
    on<HomeOnComingDetailEvent>(homeOnComingDetailEvent);
  }
  List<Results> allTopRatedMovies = [];
  List<Results> allPopulerMovies = [];
  List<Results> allOnComingMovies = [];
  List allRandomMoviesImage = [];
  Future<void> homeInitalEvent(
      HomeInitalEvent event, Emitter<HomeState> emit) async {
    emit(HomeInital());
    final movieUpComingwList = await MovieRepository().getUpComingMovies(1);
    final movieTopRatedList = await MovieRepository().getTopRatedMovies(1);
    final moviePopulerList = await MovieRepository().getNewAndPopMovies(1);
    final movieNowPlayingList = await MovieRepository().getNowPlayingMovies(1);

    emit(HomeMovieDatasState(
        movieNowPlayingList: movieNowPlayingList,
        movieUpComingwList: movieUpComingwList,
        movieTopRatedList: movieTopRatedList.results!,
        moviePopulerList: moviePopulerList));
  }

  Future<FutureOr<void>> homeTopRatedInitalEvent(
      HomeTopRatedInitalEvent event, Emitter<HomeState> emit) async {
    emit(TopRatedInitial());
    final movieDetail = await MovieRepository()
        .getTopRatedMovies(1)
        .then((value) => value.results);
    allTopRatedMovies.addAll(movieDetail!);
    emit(HomeMovieAllTopratedState(movieDetail: movieDetail));
  }

  Future<FutureOr<void>> homeTopRatedDetailEvent(
      HomeTopRatedDetailEvent event, Emitter<HomeState> emit) async {
    final movieAllTopRated =
        await MovieRepository().getTopRatedMovies(event.pageNum);
    final updatedResults = movieAllTopRated.results!;
    allTopRatedMovies.addAll(updatedResults);

    emit(HomeMovieAllTopratedState(movieDetail: allTopRatedMovies));
  }

  Future<FutureOr<void>> homePopulerInitialEvent(
      HomePopulerInitialEvent event, Emitter<HomeState> emit) async {
    emit(PopulerInitial());
    final movieDetail = await MovieRepository()
        .getPopulerMovies(1)
        .then((value) => value.results);
    allPopulerMovies.addAll(movieDetail!);
    emit(HomeMovieAllPopulerState(movieDetail: movieDetail));
  }

  Future<FutureOr<void>> homePopulerDetailEvent(
      HomePopulerDetailEvent event, Emitter<HomeState> emit) async {
    final movieAllPopuler =
        await MovieRepository().getPopulerMovies(event.pageNum);
    final updatedResults = movieAllPopuler.results!;
    allPopulerMovies.addAll(updatedResults);
    emit(HomeMovieAllPopulerState(movieDetail: allPopulerMovies));
  }

  Future<FutureOr<void>> homeOnComingInitialEvent(
      HomeOnComingInitialEvent event, Emitter<HomeState> emit) async {
    emit(OnComingInitial());
    final movieDetail = await MovieRepository()
        .getUpComingMovies(1)
        .then((value) => value.results);
    allOnComingMovies.addAll(movieDetail!);
    emit(HomeMovieAllOnComingState(movieDetail: movieDetail));
  }

  Future<FutureOr<void>> homeOnComingDetailEvent(
      HomeOnComingDetailEvent event, Emitter<HomeState> emit) async {
    final movieAllOnComing =
        await MovieRepository().getUpComingMovies(event.pageNum);
    final updatedResults = movieAllOnComing.results!;
    allOnComingMovies.addAll(updatedResults);
    emit(HomeMovieAllOnComingState(movieDetail: allOnComingMovies));
  }
}
