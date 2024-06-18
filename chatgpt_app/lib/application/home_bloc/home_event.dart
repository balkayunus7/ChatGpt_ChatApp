sealed class HomeEvent {}

final class HomeNowPlayingDetailEvent extends HomeEvent {
  HomeNowPlayingDetailEvent();
}

final class HomeTopRatedDetailEvent extends HomeEvent {
  HomeTopRatedDetailEvent();
}

final class HomePopulerDetailEvent extends HomeEvent {
  HomePopulerDetailEvent();
}

final class HomeOnComingDetailEvent extends HomeEvent {
  HomeOnComingDetailEvent();
}

final class HomeNewAndPopDetailEvent extends HomeEvent {
  HomeNewAndPopDetailEvent();
}
