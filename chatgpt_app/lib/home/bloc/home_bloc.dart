import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/service/gpt_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInital()) {
    on<HomeInitalEvent>(homeInitalEvent);
    on<HomeSearchPromptEvent>(homeSearchPromptEvent);
  }

  // Search operations
  Future<void> homeInitalEvent(
      HomeInitalEvent event, Emitter<HomeState> emit) async {
    Future.delayed(const Duration(seconds: 1), () async {
      final textResult = await GptRepository().getGptList();
      emit(HomeLoadingState(textResult!));
    });
  }

  Future<FutureOr<void>> homeSearchPromptEvent(
      HomeSearchPromptEvent event, Emitter<HomeState> emit) async {}
}
