import 'package:chatgpt_app/feauters/home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CardListView extends StatelessWidget {
  const CardListView({
    super.key,
    required this.homeMovieDatasState,
  });
  final HomeMovieDatasState homeMovieDatasState;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: homeMovieDatasState.movieTopRatedList.results!.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: context.padding.low,
              child: SizedBox(
                width: 140,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${homeMovieDatasState.movieTopRatedList.results![index].posterPath}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class CardListPopulerView extends StatelessWidget {
  const CardListPopulerView({
    super.key,
    required this.homeMovieDatasState,
  });
  final HomeMovieDatasState homeMovieDatasState;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: homeMovieDatasState.movieTopRatedList.results!.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: context.padding.low,
              child: SizedBox(
                width: 140,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${homeMovieDatasState.moviePopulerList.results![index].posterPath}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          }),
    );
  }
}



class CardListUpComingView extends StatelessWidget {
  const CardListUpComingView({
    super.key,
    required this.homeMovieDatasState,
  });
  final HomeMovieDatasState homeMovieDatasState;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: homeMovieDatasState.movieTopRatedList.results!.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: context.padding.low,
              child: SizedBox(
                width: 140,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${homeMovieDatasState.movieUpComingwList.results![index].posterPath}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          }),
    );
  }
}


