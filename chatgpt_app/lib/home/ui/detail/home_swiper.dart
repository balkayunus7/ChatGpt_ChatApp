import 'package:card_swiper/card_swiper.dart';
import 'package:chatgpt_app/product/constants/color_constants.dart';
import 'package:chatgpt_app/product/enums/widget_sizes.dart';
import 'package:flutter/material.dart';

class HomeSwiper extends StatelessWidget {
  const HomeSwiper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      child: Swiper(
        curve: Curves.easeIn,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: WidgetSizeConstants.borderRadiusNormal,
            child: Image.network(
              'https://cdn.entries.clios.com/styles/clio_aotw_image_panels_retina/s3/entry_attachments/image/72/2297/22197/123550/ub8REW-EUOXIJDzHkrLiotLY2dSm9j-EOjXCDUbrPYQ.jpeg',
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: 5,
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
