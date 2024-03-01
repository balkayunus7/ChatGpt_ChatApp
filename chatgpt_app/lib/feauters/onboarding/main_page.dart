import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatgpt_app/feauters/onboarding/onboarding_main_page.dart';
import 'package:chatgpt_app/product/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.route.navigateToPage(const OnBoardingMainPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.primaryMain,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Image(height: 150, image: AssetImage('images/logo.png')),
            ),
            AnimatedTextKit(animatedTexts: [
              WavyAnimatedText('Cinefy',
                  textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.primaryWhite)),
            ]),
          ],
        ));
  }
}
