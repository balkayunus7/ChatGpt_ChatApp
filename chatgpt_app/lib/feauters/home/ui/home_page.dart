import 'package:chatgpt_app/feauters/home/bloc/home_bloc.dart';
import 'package:chatgpt_app/feauters/home/bloc/home_state.dart';
import 'package:chatgpt_app/feauters/home/mixin/home_mixin.dart';
import 'package:chatgpt_app/product/constants/color_constants.dart';
import 'package:chatgpt_app/product/constants/string_constants.dart';
import 'package:chatgpt_app/product/widgets/loading/custom_appbar.dart';
import 'package:chatgpt_app/product/widgets/loading/custom_loading_scaffold.dart';
import 'package:chatgpt_app/product/widgets/texts/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'detail/home_cardListview.dart';
import 'detail/home_swiper.dart';
import 'detail/titleListviewRow.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      bloc: homeBloc,
      builder: (context, state) {
        final currentState = state;
        switch (currentState.runtimeType) {
          case HomeInital:
            return const LoadingScaffold();
          case HomeMovieDatasState:
            final homeMovieDatasState = currentState as HomeMovieDatasState;
            return Scaffold(
              appBar: CustomAppBar(
                onPressedBack: () {},
                title: StringConstants.homeTitle.toUpperCase(),
                icon: null,
                iconSearch: Icons.search,
                preferredSize: const Size.fromHeight(kToolbarHeight),
                onPressed: () {},
                child: const SizedBox.shrink(),
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Trending Movies Swiper
                    Padding(
                      padding:
                          context.padding.horizontalNormal.copyWith(bottom: 10),
                      child: const MiniTitle(
                          subtitle: StringConstants.trendTitle,
                          color: ColorConstants.primaryWhite),
                    ),
                    HomeSwiper(
                      homeMovieDatasState: homeMovieDatasState,
                    ),
                    // Top Rated Movies
                    TitleListviewRow(
                      title: StringConstants.topRated,
                      onPressed: toTopRatedPage,
                    ),
                    CardListView(
                      homeMovieDatasState: homeMovieDatasState,
                    ),
                    // Populer Movies
                    TitleListviewRow(
                      title: StringConstants.populer,
                      onPressed: toPopulerPage,
                    ),
                    CardListPopulerView(
                      homeMovieDatasState: homeMovieDatasState,
                    ),
                    // Upcoming Movies
                    TitleListviewRow(
                      title: StringConstants.onComing,
                      onPressed: toUpcomingPage,
                    ),
                    CardListUpComingView(
                        homeMovieDatasState: homeMovieDatasState),
                  ],
                ),
              ),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
