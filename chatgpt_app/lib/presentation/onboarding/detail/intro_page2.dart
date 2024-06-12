import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../product/widgets/texts/onboarding_text.dart';

class IntroPage2 extends StatefulWidget {
  const IntroPage2(
      {super.key,
      required this.onPressedBackward,
      required this.onPressedForward});
  final VoidCallback onPressedForward;
  final VoidCallback onPressedBackward;

  @override
  State<IntroPage2> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<IntroPage2> {
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
                  'https://www.themoviedb.org/t/p/w1280/39wmItIWsg5sZMyRUHLkWBcuVCM.jpg')),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: context.padding.horizontalNormal,
                  child: const OnBoardingText(
                    color: Colors.white,
                    text:
                        'Add your favorite movies to the list for quick access',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: context.padding.onlyTopNormal,
                      child: ElevatedButton(
                          onPressed: () {
                            widget.onPressedBackward();
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          )),
                    ),
                    Padding(
                      padding: context.padding.onlyTopNormal,
                      child: ElevatedButton(
                          onPressed: () {
                            widget.onPressedForward();
                          },
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          )),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
