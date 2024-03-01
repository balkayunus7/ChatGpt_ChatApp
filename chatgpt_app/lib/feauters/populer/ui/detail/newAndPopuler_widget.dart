import 'package:chatgpt_app/product/constants/color_constants.dart';
import 'package:chatgpt_app/product/constants/string_constants.dart';
import 'package:chatgpt_app/product/widgets/texts/subtitle_text.dart';
import 'package:chatgpt_app/product/widgets/texts/title_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../../../product/enums/widget_sizes.dart';

class NewAndPopulerWidget extends StatelessWidget {
  const NewAndPopulerWidget({
    super.key,
    required this.populerImage,
    required this.populerTitle,
    required this.populerDateDay,
    required this.populerDescription,
    required this.populerDateMonth,
    required this.populerDate,
  });

  final String populerImage;
  final String populerTitle;
  final String populerDateMonth;
  final String populerDateDay;
  final String populerDate;
  final String populerDescription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: context.padding.onlyTopLow,
              child: Column(
                children: [
                  MiniTitle(
                      subtitle: populerDateMonth,
                      color: ColorConstants.primaryGrey),
                  TitleText(title: populerDateDay, color: Colors.white)
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: context.padding.low,
                    child: ClipRRect(
                      borderRadius: WidgetSizeConstants.borderRadiusNormal,
                      child: Image.network(
                        'https://image.tmdb.org/t/p/original$populerImage',
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleText(
                          title: populerTitle.length > 13
                              ? '${populerTitle.substring(0, 13)}...'
                              : populerTitle,
                          color: Colors.white),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.add_alert_outlined)),
                          const SubtitleText(
                              subtitle: StringConstants.rememeberMe,
                              color: Colors.grey)
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.info_outline)),
                          const SubtitleText(
                              subtitle: StringConstants.info,
                              color: Colors.grey)
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: context.padding.onlyTopLow,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MiniTitle(
                            subtitle:
                                '${StringConstants.releaseDate} $populerDate',
                            color: Colors.white),
                        SubtitleText(
                            subtitle: populerDescription,
                            color: ColorConstants.primaryGrey)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}
