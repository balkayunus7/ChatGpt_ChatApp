import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CardListView extends StatelessWidget {
  const CardListView({
    super.key, required this.imagePath,
  });
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: context.padding.low,
              child: SizedBox(
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/original$imagePath',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
