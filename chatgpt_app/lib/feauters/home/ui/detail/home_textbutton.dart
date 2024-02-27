import 'package:flutter/material.dart';
import '../../../../product/constants/color_constants.dart';
import '../../../../product/constants/string_constants.dart';
import '../../../../product/widgets/texts/subtitle_text.dart';

class SeeAllWidget extends StatelessWidget {
  const SeeAllWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const SubtitleText(
          subtitle: StringConstants.seeAll, color: ColorConstants.primaryGrey),
    );
  }
}
