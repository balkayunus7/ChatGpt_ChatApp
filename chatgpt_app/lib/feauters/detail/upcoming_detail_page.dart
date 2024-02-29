import 'package:chatgpt_app/feauters/home/bloc/home_bloc.dart';
import 'package:chatgpt_app/feauters/home/bloc/home_state.dart';
import 'package:chatgpt_app/product/widgets/loading/custom_appbar.dart';
import 'package:chatgpt_app/product/widgets/loading/custom_loading_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../home/bloc/home_event.dart';

class UpComingPage extends StatefulWidget {
  const UpComingPage({super.key});

  @override
  State<UpComingPage> createState() => _UpComingPageState();
}

class _UpComingPageState extends State<UpComingPage> {
  final ScrollController _scrollController = ScrollController();
  int pageNum = 1;

  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeOnComingInitialEvent());
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        pageNum = pageNum + 1;
      });
      homeBloc.add(HomeOnComingDetailEvent(pageNum: pageNum));
    }
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listener: (context, state) {},
      builder: (context, state) {
        final currentState = state;
        switch (currentState.runtimeType) {
          case OnComingInitial:
            return const LoadingScaffold();
          case HomeMovieAllOnComingState:
            final homeMovieAllOnComingState =
                currentState as HomeMovieAllOnComingState;
            return Scaffold(
              appBar: CustomAppBar(
                  onPressedBack: () {
                    Navigator.pop(context);
                  },
                  title: 'Up Coming'.toUpperCase(),
                  icon: Icons.arrow_back_ios,
                  iconSearch: null,
                  preferredSize: const Size.fromHeight(kToolbarHeight),
                  onPressed: () {},
                  child: const SizedBox.shrink()),
              body: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      controller: _scrollController,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, // İki sütunlu bir grid oluşturur
                        crossAxisSpacing: 5, // Sütunlar arası boşluk
                        mainAxisSpacing: 10, // Satırlar arası boşluk
                        childAspectRatio: 0.7, // Widgetlerin boyut oranı
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.blueGrey,
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500${homeMovieAllOnComingState.movieDetail[index].posterPath}',
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                      itemCount: homeMovieAllOnComingState
                          .movieDetail.length, // Toplam öğe sayısı
                    ),
                  ),
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
