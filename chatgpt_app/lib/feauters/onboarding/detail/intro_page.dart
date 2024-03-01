import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../../product/widgets/texts/onboarding_text.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final String imageUrl =
      'https://www.themoviedb.org/t/p/w1280/7fn624j5lj3xTme2SgiLCeuedmO.jpg';

  NetworkImage getImage() {
    return NetworkImage(imageUrl);
  }

  @override
  void initState() {
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
           Image(
              height: double.infinity,
              width: double.infinity,
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
              image: getImage()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: context.padding.horizontalLow,
                  child: const OnBoardingText(
                    color: Colors.white,
                    text: 'Explore thousands of movies across various genres',
                  ),
                ),
                Padding(
                  padding: context.padding.onlyTopNormal,
                  child: ElevatedButton(
                      onPressed: () {
                        widget.onPressed();
                      },
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
