import 'dart:async';
import 'package:chatgpt_app/feauters/populer/bloc/new_event.dart';
import 'package:chatgpt_app/feauters/populer/bloc/new_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/service/movie_repository.dart';

class NewPopBloc extends Bloc<NewPopEvent, NewPopState> {
  NewPopBloc() : super(NewPopInital()) {
    on<NewPopInitalEvent>(newPopInitalEvent);
  }

  Future<FutureOr<void>> newPopInitalEvent(
      NewPopInitalEvent event, Emitter<NewPopState> emit) async {
    emit(NewPopInital());
    final moviePopNewList = await MovieRepository().getNewAndPopMovies(1);
    emit(NewPopMovieState(moviePopNewList: moviePopNewList));
  }
}
