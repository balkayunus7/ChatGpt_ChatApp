import 'package:chatgpt_app/presentation/product/widgets/texts/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../product/widgets/texts/onboarding_text.dart';

class IntroPage3 extends StatefulWidget {
  const IntroPage3({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  State<IntroPage3> createState() => _IntroPage3State();
}

class _IntroPage3State extends State<IntroPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Image(
              height: double.infinity,
              width: double.infinity,
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://www.themoviedb.org/t/p/w1280/8OKmBV5BUFzmozIC3pPWKHy17kx.jpg')),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: context.padding.horizontalLow,
                  child: const OnBoardingText(
                    color: Colors.white,
                    text: "Let's dive in and enjoy the movie experience!",
                  ),
                ),
                Padding(
                  padding: context.padding.normal,
                  child: ElevatedButton(
                      onPressed: () {
                        widget.onPressed();
                      },
                      child: const MiniTitle(
                          subtitle: 'Get Started', color: Colors.black)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
