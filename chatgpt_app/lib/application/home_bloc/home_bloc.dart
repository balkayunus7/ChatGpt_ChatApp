import 'dart:async';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:chatgpt_app/core/service/movie_repository.dart';
import 'package:chatgpt_app/application/home_bloc/home_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<HomeEvent>(
      (event, emit) async {
        if (event is HomeTopRatedDetailEvent) {
          await _onTopRatedMoviesFetched(event, emit);
        } else if (event is HomeNowPlayingDetailEvent) {
          await _onNowPlayingMoviesFetched(event, emit);
        } else if (event is HomeNewAndPopDetailEvent) {
          await _onNewAndPopMoviesFetched(event, emit);
        } else if (event is HomePopulerDetailEvent) {
          await _onPopularMoviesFetched(event, emit);
        } else if (event is HomeOnComingDetailEvent) {
          await _onUpcomingMoviesFetched(event, emit);
        }
      },
      transformer: sequential(),
    );
  }

  void addFetched() {
    add(HomeTopRatedDetailEvent());
    add(HomeNewAndPopDetailEvent());
    add(HomeNowPlayingDetailEvent());
    add(HomePopulerDetailEvent());
    add(HomeNowPlayingDetailEvent());
    add(HomeOnComingDetailEvent());
  }

  Future<void> _onNewAndPopMoviesFetched(
    HomeNewAndPopDetailEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        movieNowPlayingList: const None(),
      ),
    );
    final newAndPopMovies = MovieRepository().getNewAndPopMovies();
    emit(
      state.copyWith(
        movieNowPlayingList: await newAndPopMovies,
      ),
    );
  }

  Future<void> _onTopRatedMoviesFetched(
    HomeTopRatedDetailEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        movieTopRatedList: const None(),
      ),
    );
    final topRatedMovies = MovieRepository().getTopRatedMovies();
    emit(
      state.copyWith(
        movieTopRatedList: await topRatedMovies,
      ),
    );
  }

  Future<void> _onUpcomingMoviesFetched(
    HomeOnComingDetailEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        movieOnComingList: const None(),
      ),
    );
    final upComingMovies = MovieRepository().getUpComingMovies();
    emit(
      state.copyWith(
        movieOnComingList: await upComingMovies,
      ),
    );
  }

  Future<void> _onPopularMoviesFetched(
    HomePopulerDetailEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        moviePopulerList: const None(),
      ),
    );
    final popularMovies = MovieRepository().getPopulerMovies();
    emit(
      state.copyWith(
        moviePopulerList: await popularMovies,
      ),
    );
  }

  Future<void> _onNowPlayingMoviesFetched(
    HomeNowPlayingDetailEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        moviePopulerList: const None(),
      ),
    );
    final nowPlayingMovies = MovieRepository().getNowPlayingMovies();
    emit(
      state.copyWith(
        moviePopulerList: await nowPlayingMovies,
      ),
    );
  }
}
