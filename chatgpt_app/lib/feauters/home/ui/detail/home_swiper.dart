import 'package:card_swiper/card_swiper.dart';
import 'package:chatgpt_app/feauters/home/bloc/home_state.dart';
import 'package:chatgpt_app/product/constants/color_constants.dart';
import 'package:chatgpt_app/product/enums/widget_sizes.dart';
import 'package:flutter/material.dart';

class HomeSwiper extends StatelessWidget {
  const HomeSwiper({
    super.key,
    required this.homeMovieDatasState,
  });

  final HomeMovieDatasState homeMovieDatasState;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Swiper(
        curve: Curves.easeIn,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: WidgetSizeConstants.borderRadiusNormal,
            child: Image.network(
              'https://image.tmdb.org/t/p/w500${homeMovieDatasState.movieNowPlayingList.results![index].posterPath}',
              fit: BoxFit.fill,
            ),
          );
        },
        itemCount: 7,
        itemHeight: 400,
        itemWidth: 400,
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
