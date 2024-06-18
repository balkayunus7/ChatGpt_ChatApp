import 'package:chatgpt_app/core/models/movie.dart';
import 'package:chatgpt_app/presentation/home/mixin/home_mixin.dart';
import 'package:chatgpt_app/presentation/home/ui/detail/home_card_listview.dart';
import 'package:chatgpt_app/presentation/home/ui/detail/title_listview_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatgpt_app/application/home_bloc/home_bloc.dart';
import 'package:chatgpt_app/application/home_bloc/home_state.dart';
import 'package:chatgpt_app/core/injector/setup_injector.dart';
import 'package:chatgpt_app/presentation/home/ui/detail/home_swiper.dart';
import 'package:chatgpt_app/presentation/product/constants/string_constants.dart';
import 'package:chatgpt_app/presentation/product/widgets/loading/custom_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return getIt<HomeBloc>()..addFetched();
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) {
          return previous.movieNowPlayingList.isNone() &&
                  current.movieNowPlayingList.isSome() ||
              previous.movieNowPlayingList.isSome() &&
                  current.movieNowPlayingList.isSome() ||
              previous.movieTopRatedList.isNone() &&
                  current.movieTopRatedList.isSome();
        },
        builder: (BuildContext context, HomeState state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
            appBar: CustomAppBar(
              onPressedBack: () {},
              title: StringConstants.homeTitle.toUpperCase(),
              iconSearch: Icons.search,
              preferredSize: const Size.fromHeight(kToolbarHeight),
              onPressed: () {},
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMovieSection(
                      title: StringConstants.trendTitle,
                      movieListSelector: (state) => state.movieNowPlayingList,
                      buildWidget: (movieList) =>
                          HomeSwiper(movieNewAndPopList: movieList),
                    ),
                    _buildMovieSection(
                      title: StringConstants.topRated,
                      movieListSelector: (state) => state.movieTopRatedList,
                      buildWidget: (movieList) =>
                          CardListView(movieList: movieList),
                    ),
                    _buildMovieSection(
                      title: StringConstants.onComing,
                      movieListSelector: (state) => state.movieOnComingList,
                      buildWidget: (movieList) =>
                          CardListView(movieList: movieList),
                    ),
                    _buildMovieSection(
                      title: StringConstants.newAndPopuler,
                      movieListSelector: (state) => state.moviePopulerList,
                      buildWidget: (movieList) =>
                          CardListView(movieList: movieList),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMovieSection({
    required String title,
    required dynamic Function(HomeState) movieListSelector,
    required Widget Function(List<Results>) buildWidget,
  }) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        return movieListSelector(previous) != movieListSelector(current);
      },
      builder: (context, state) {
        return movieListSelector(state).fold(
          () => const SizedBox.shrink(),
          (movieList) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleListViewRow(
                  title: title,
                  onPressed: () {},
                ),
                buildWidget(movieList),
              ],
            );
          },
        );
      },
    );
  }
}
