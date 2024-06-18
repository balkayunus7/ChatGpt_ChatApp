import 'package:chatgpt_app/presentation/onboarding/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'detail/intro_page.dart';
import 'detail/intro_page2.dart';
import 'detail/intro_page3.dart';


class OnBoardingMainPage extends StatefulWidget {
  const OnBoardingMainPage({super.key});

  @override
  State<OnBoardingMainPage> createState() => _OnBoardingMainPageState();
}

class _OnBoardingMainPageState extends State<OnBoardingMainPage> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _pageController,
          children: [
            IntroPage(
              onPressed: () {
                _pageController.animateToPage(1,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut);
              },
            ),
            IntroPage2(
              onPressedForward: () {
                _pageController.animateToPage(2,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut);
              },
              onPressedBackward: () {
                _pageController.animateToPage(0,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut);
              },
            ),
            IntroPage3(
              onPressed: () {
                context.route.navigateToPage(const NavigationPage());
              },
            ),
          ],
        ),
        Container(
          alignment: const Alignment(0, 0.9),
          child: SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: const WormEffect(),
          ),
        )
      ],
    );
  }
}
