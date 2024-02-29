import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../../../product/constants/color_constants.dart';
import '../../../../product/widgets/texts/subtitle_text.dart';
import 'home_textbutton.dart';

class TitleListviewRow extends StatelessWidget {
  const TitleListviewRow({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.horizontalNormal.copyWith(bottom: 2, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MiniTitle(subtitle: title, color: ColorConstants.primaryWhite),
          SeeAllWidget(
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}
