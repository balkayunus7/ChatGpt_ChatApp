import 'package:chatgpt_app/product/constants/color_constants.dart';
import 'package:chatgpt_app/product/constants/string_constants.dart';
import 'package:chatgpt_app/product/widgets/custom_appbar.dart';
import 'package:chatgpt_app/product/widgets/texts/subtitle_text.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'detail/home_cardListview.dart';
import 'detail/home_swiper.dart';
import 'detail/home_textfield.dart';
import 'detail/titleListviewRow.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryDark,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: ColorConstants.primeryFilled,
        color: ColorConstants.primeryFilled,
        animationDuration: const Duration(milliseconds: 400),
        height: 70,
        items: const [
          Icon(Icons.home, size: 30),
          Icon(Icons.search, size: 30),
          Icon(Icons.favorite, size: 30),
          Icon(Icons.person, size: 30),
        ],
      ),
      appBar: CustomAppBar(
        onPressedBack: () {},
        title: StringConstants.homeTitle,
        icon: null,
        iconLike: null,
        preferredSize: const Size.fromHeight(kToolbarHeight),
        onPressed: () {},
        child: const SizedBox.shrink(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: context.padding.normal,
              child: const HomeTexfield(),
            ),
            Padding(
              padding: context.padding.horizontalNormal.copyWith(bottom: 10),
              child: const MiniTitle(
                  subtitle: StringConstants.trendTitle,
                  color: ColorConstants.primaryWhite),
            ),
            const HomeSwiper(),
            const TitleListviewRow(title: StringConstants.topRated),
            const CardListView(
              imagePath:
                  'https://m.media-amazon.com/images/M/MV5BNGIyYWMzNjktNDE3MC00YWQyLWEyMmEtN2ZmNzZhZDk3NGJlXkEyXkFqcGdeQXVyMTUzMTg2ODkz._V1_.jpg',
            ),
            const TitleListviewRow(
              title: StringConstants.populer,
            ),
            const CardListView(
              imagePath:
                  'https://m.media-amazon.com/images/M/MV5BNjMyMDBjMGUtNDUzZi00N2MwLTg1MjItZTk2MDE1OTZmNTYxXkEyXkFqcGdeQXVyMTQ5NjA0NDM0._V1_FMjpg_UX1000_.jpg',
            ),
            const TitleListviewRow(
              title: StringConstants.onComing,
            ),
            const CardListView(
                imagePath:
                    'https://sm.ign.com/ign_tr/photo/d/dune-part-/dune-part-two-exclusive-new-poster-features-its-stellar-cast_g26d.jpg'),
          ],
        ),
      ),
    );
  }
}
