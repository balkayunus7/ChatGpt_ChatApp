import 'package:card_swiper/card_swiper.dart';
import 'package:chatgpt_app/presentation/product/constants/color_constants.dart';
import 'package:chatgpt_app/presentation/product/enums/widget_sizes.dart';
import 'package:chatgpt_app/presentation/product/widgets/texts/swiper_text.dart';
import 'package:flutter/material.dart';
import 'package:chatgpt_app/core/models/movie.dart';

class HomeSwiper extends StatelessWidget {
  const HomeSwiper({
    super.key,
    required this.movieNewAndPopList,
  });
  final List<Results> movieNewAndPopList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: Swiper(
        curve: Curves.easeIn,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: WidgetSizeConstants.borderRadiusNormal,
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${movieNewAndPopList[index].backdropPath}',
                  fit: BoxFit.cover,
                ),
              ),
              SwiperText(
                title: movieNewAndPopList[index].title ?? '',
              )
            ],
          );
        },
        itemCount: 7,
        itemHeight: 300,
        viewportFraction: 0.8,
        scale: 0.9,
        pagination: const SwiperPagination(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 5),
            builder: DotSwiperPaginationBuilder(
                size: 10,
                color: ColorConstants.primaryGrey,
                space: 3,
                activeColor: ColorConstants.primaryWhite)),
      ),
    );
  }
}
