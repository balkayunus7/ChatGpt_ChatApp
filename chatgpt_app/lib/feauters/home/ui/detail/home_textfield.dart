import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import '../../../../product/constants/color_constants.dart';
import '../../../../product/constants/string_constants.dart';
import '../../../../product/enums/widget_sizes.dart';

class HomeTexfield extends StatelessWidget {
  const HomeTexfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: context.padding.low,
        hintText: StringConstants.hintText,
        prefixIcon: const Icon(
          Icons.search,
          color: ColorConstants.primaryGrey,
        ),
        hintStyle: TextStyle(
            color: Colors.grey, fontFamily: GoogleFonts.lato().fontFamily),
        filled: true,
        fillColor: ColorConstants.primeryFilled,
        border: OutlineInputBorder(
          borderRadius: WidgetSizeConstants.borderRadiusNormal,
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
