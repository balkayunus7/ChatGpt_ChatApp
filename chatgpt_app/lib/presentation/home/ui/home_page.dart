import 'package:chatgpt_app/application/home/home_mixin/home_mixin.dart';
import 'package:chatgpt_app/presentation/home/ui/detail/home_cardListview.dart';
import 'package:chatgpt_app/presentation/home/ui/detail/titleListviewRow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:chatgpt_app/application/home/home_bloc/home_bloc.dart';
import 'package:chatgpt_app/application/home/home_bloc/home_state.dart';
import 'package:chatgpt_app/core/setup_injector.dart';
import 'package:chatgpt_app/presentation/home/ui/detail/home_swiper.dart';
import 'package:chatgpt_app/presentation/product/constants/color_constants.dart';
import 'package:chatgpt_app/presentation/product/constants/string_constants.dart';
import 'package:chatgpt_app/presentation/product/widgets/loading/custom_appbar.dart';
import 'package:chatgpt_app/presentation/product/widgets/texts/subtitle_text.dart';

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
      child: Scaffold(
        appBar: CustomAppBar(
          onPressedBack: () {},
          title: StringConstants.homeTitle.toUpperCase(),
          icon: null,
          iconSearch: Icons.search,
          preferredSize: const Size.fromHeight(kToolbarHeight),
          onPressed: () {},
          child: const SizedBox.shrink(),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (previous, current) {
                    return previous.movieNowPlayingList !=
                        current.movieNowPlayingList;
                  },
                  builder: (context, state) {
                    return state.movieNowPlayingList.fold(
                      () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      (newAndPopList) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: context.padding.horizontalNormal
                                  .copyWith(bottom: 10),
                              child: const MiniTitle(
                                  subtitle: StringConstants.trendTitle,
                                  color: ColorConstants.primaryWhite),
                            ),
                            HomeSwiper(
                              movieNewAndPopList: newAndPopList,
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                TitleListviewRow(
                  title: StringConstants.topRated,
                  onPressed: () {
                    toTopRatedPage();
                  },
                ),
                BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (previous, current) {
                    return previous.movieTopRatedList !=
                        current.movieTopRatedList;
                  },
                  builder: (context, state) {
                    return state.movieTopRatedList.fold(
                      () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      (topRatedList) {
                        return CardListView(
                          movieList: topRatedList,
                        );
                      },
                    );
                  },
                ),
                TitleListviewRow(
                  title: StringConstants.onComing,
                  onPressed: () {},
                ),
                BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (previous, current) {
                    return previous.movieUpComingList !=
                        current.movieUpComingList;
                  },
                  builder: (context, state) {
                    return state.movieUpComingList.fold(
                      () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      (upComingList) {
                        return CardListView(
                          movieList: upComingList,
                        );
                      },
                    );
                  },
                ),
                TitleListviewRow(
                  title: StringConstants.newAndPopuler,
                  onPressed: () {},
                ),
                BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (previous, current) {
                    return previous.moviePopulerList !=
                        current.moviePopulerList;
                  },
                  builder: (context, state) {
                    return state.moviePopulerList.fold(
                      () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      (popularList) {
                        return CardListView(
                          movieList: popularList,
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
