import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  const TitleText({required this.title, required this.color, super.key});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: GoogleFonts.bebasNeue(
        color: color,
        fontSize: 40,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
