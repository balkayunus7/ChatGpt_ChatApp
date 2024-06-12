import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/color_constants.dart';

class SwiperText extends StatelessWidget {
  const SwiperText({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.anekGurmukhi(
        color: ColorConstants.primaryWhite,
        shadows: [
          const Shadow(
            blurRadius: 10.0,
            color: ColorConstants.primaryDark,
            offset: Offset(5.0, 5.0),
          ),
        ],
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
