import 'package:chatgpt_app/product/widgets/texts/title_text.dart';
import 'package:flutter/material.dart';
import '../constants/color_constants.dart';
import '../enums/widget_sizes.dart';

class CustomAppBar extends PreferredSize {
  const CustomAppBar({
    required this.onPressedBack,
    super.key,
    required this.title,
    required this.icon,
    required this.iconLike,
    required super.preferredSize,
    required super.child,
    required this.onPressed,
  });

  final String title;
  final IconData? icon;
  final IconData? iconLike;
  final VoidCallback onPressed;
  final VoidCallback onPressedBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      actions: [
        IconButton(
          iconSize: WidgetSize.iconNormal.value,
          icon: Icon(iconLike),
          onPressed: onPressed,
          color: ColorConstants.primaryWhite,
        ),
      ],
      leading: IconButton(
        iconSize: WidgetSize.iconNormal.value,
        onPressed: onPressedBack,
        icon: Icon(
          icon,
          color: ColorConstants.primaryWhite,
        ),
      ),
      centerTitle: true,
      title: TitleText(
        title: title,
        color: ColorConstants.primaryRed,
      ),
      backgroundColor: Colors.transparent,
    );
  }
}