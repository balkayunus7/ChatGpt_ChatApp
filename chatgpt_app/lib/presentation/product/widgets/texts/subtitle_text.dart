import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MiniTitle extends StatelessWidget {
  const MiniTitle({required this.subtitle, required this.color, super.key});

  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(subtitle,
        textAlign: TextAlign.start,
        style: GoogleFonts.anekGurmukhi(
          color: color,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ));
  }
}

class SubtitleText extends StatelessWidget {
  const SubtitleText({required this.subtitle, required this.color, super.key});

  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.2),
      child: Text(subtitle,
          textAlign: TextAlign.start,
          style: GoogleFonts.anekGurmukhi(
            color: color,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
