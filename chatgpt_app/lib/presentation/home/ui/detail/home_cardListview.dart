import 'package:chatgpt_app/core/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CardListView extends StatelessWidget {
  const CardListView({
    super.key,
    required this.movieList,
  });
  final List<Results> movieList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: movieList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: context.padding.horizontalLow,
              child: SizedBox(
                width: 140,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${movieList[index].posterPath}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
