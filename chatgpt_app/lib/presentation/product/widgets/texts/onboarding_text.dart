import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingText extends StatelessWidget {
  const OnBoardingText({
    super.key,
    required this.color,
    required this.text,
  });
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.anekGurmukhi(
        fontSize: 28,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
