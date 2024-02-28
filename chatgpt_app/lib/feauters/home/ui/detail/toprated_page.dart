import 'package:chatgpt_app/feauters/home/bloc/home_bloc.dart';
import 'package:chatgpt_app/feauters/home/bloc/home_state.dart';
import 'package:chatgpt_app/product/widgets/loading/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home_event.dart';

class TopRatedPage extends StatefulWidget {
  const TopRatedPage({super.key});

  @override
  State<TopRatedPage> createState() => _TopRatedPageState();
}

class _TopRatedPageState extends State<TopRatedPage> {
  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeTopRatedInitalEvent());
  }

  int pageNum = 1;
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listener: (context, state) {},
      builder: (context, state) {
        final currentState = state;
        switch (currentState.runtimeType) {
          case TopRatedInitial:
            return Scaffold(
              appBar: CustomAppBar(
                  onPressedBack: () {},
                  title: 'Top Rated'.toUpperCase(),
                  icon: null,
                  iconSearch: null,
                  preferredSize: const Size.fromHeight(kToolbarHeight),
                  onPressed: () {},
                  child: const SizedBox.shrink()),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeMovieAllTopratedState:
            final homeMovieAllTopratedState =
                currentState as HomeMovieAllTopratedState;
            return Scaffold(
              appBar: CustomAppBar(
                  onPressedBack: () {},
                  title: 'Top Rated'.toUpperCase(),
                  icon: null,
                  iconSearch: null,
                  preferredSize: const Size.fromHeight(kToolbarHeight),
                  onPressed: () {},
                  child: const SizedBox.shrink()),
              body: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, // İki sütunlu bir grid oluşturur
                        crossAxisSpacing: 5, // Sütunlar arası boşluk
                        mainAxisSpacing: 5, // Satırlar arası boşluk
                        childAspectRatio: 0.7, // Widgetlerin boyut oranı
                      ),
                      itemBuilder: (context, index) {
                        // Burada her bir grid öğesi için nasıl bir widget oluşturacağınızı tanımlayabilirsiniz
                        return Container(
                          color: Colors.blueGrey,
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500${homeMovieAllTopratedState.movieDetail.results![index].posterPath}',
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                      itemCount: homeMovieAllTopratedState
                          .movieDetail.results!.length, // Toplam öğe sayısı
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(itemCount: 20,itemBuilder: (context, index) {
                          return TextButton(
                            onPressed: () {
                              homeBloc.add(
                                  HomeTopRatedDetailEvent(pageNum: index + (index + 1)));
                            },
                            child: Text((index + 1).toString()),
                          );
                        }),
                      )
                    ],
                  )
                ],
              ),
            );
          default:
        }
        return const SizedBox.shrink();
      },
    );
  }
}
