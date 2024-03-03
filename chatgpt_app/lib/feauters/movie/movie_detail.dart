import 'package:chatgpt_app/product/widgets/texts/subtitle_text.dart';
import 'package:chatgpt_app/product/widgets/texts/title_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({super.key});

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: const TitleText(title: 'Dune Part Two', color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'images/dune.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 240,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                              padding: context.padding.low,
                              child: const TitleText(
                                  title: 'Dune : Part Two',
                                  color: Colors.white)),
                          Padding(
                            padding: context.padding.horizontalLow,
                            child: const SubtitleText(
                                subtitle: 'DIRECTED BY', color: Colors.grey),
                          ),
                          Padding(
                              padding: context.padding.horizontalLow,
                              child: const SubtitleText(
                                  subtitle: 'Denis Villeneuve',
                                  color: Colors.white)),
                          Row(
                            children: [
                              Padding(
                                padding: context.padding.low,
                                child: const MiniTitle(
                                    subtitle: '2024', color: Colors.grey),
                              ),
                              Padding(
                                padding: context.padding.horizontalLow,
                                child: const MiniTitle(
                                    subtitle: '166 mins', color: Colors.grey),
                              ),
                              Padding(
                                padding: context.padding.horizontalLow,
                                child: const MiniTitle(
                                    subtitle: ' TRAILER', color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.network(
                        'https://www.themoviedb.org/t/p/w1280/8b8R8l88Qje9dn9OE8PY05Nxl1X.jpg',
                        width: 90,
                        fit: BoxFit.fitWidth,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: context.padding.low,
                  child: const SubtitleText(
                      subtitle:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.cascascbhachjacsjacjahjscbajchshjcjskbacsachjascbashjcajhcbahjs Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet.',
                      color: Colors.grey),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: context.padding.low,
                      child: const SubtitleText(
                          subtitle: 'RATING', color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: context.padding.low,
                          child: const MiniTitle(
                              subtitle: 'Popularity', color: Colors.white),
                        ),
                        Padding(
                          padding: context.padding.low,
                          child: const TitleText(
                              title: '*****', color: Colors.white),
                        ),
                        Padding(
                          padding: context.padding.low,
                          child: const TitleText(
                              title: '8.53', color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: context.padding.horizontalLow,
                  child: const TitleText(title: 'Counts', color: Colors.grey),
                ),
                Padding(
                  padding: context.padding.low,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MovieCountContainer(
                        color: Colors.green,
                        subtitle: 'Members',
                        count: '333k',
                        icon: Icons.remove_red_eye,
                      ),
                      MovieCountContainer(
                        color: Colors.grey,
                        subtitle: 'Reviews',
                        count: '138k',
                        icon: Icons.bookmark,
                      ),
                      MovieCountContainer(
                        color: Colors.blueAccent,
                        subtitle: 'Lists',
                        count: '7k',
                        icon: Icons.list_alt,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: context.padding.low,
                  child: const TitleText(title: 'Genre', color: Colors.grey),
                ),
                Row(
                  children: [
                    Padding(
                      padding: context.padding.horizontalLow,
                      child: const MiniTitle(
                          subtitle: 'Action', color: Colors.white),
                    ),
                    Padding(
                      padding: context.padding.horizontalLow,
                      child: const MiniTitle(
                          subtitle: 'Adventure', color: Colors.white),
                    ),
                    Padding(
                      padding: context.padding.horizontalLow,
                      child: const MiniTitle(
                          subtitle: 'Sci-Fi', color: Colors.white),
                    ),
                  ],
                ),
                Divider(color: Colors.grey),
                Padding(
                  padding: context.padding.low,
                  child: const TitleText(title: 'Cast', color: Colors.grey),
                ),
                Padding(
                  padding: context.padding.low,
                  child: SizedBox(
                    height: 95,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: context.padding.horizontalLow,
                          child: Column(
                            children: [
                              const CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    'https://www.themoviedb.org/t/p/w1280/8b8R8l88Qje9dn9OE8PY05Nxl1X.jpg'),
                              ),
                              Padding(
                                padding: context.padding.onlyTopLow,
                                child: const MiniTitle(
                                    subtitle: 'Timothée Chal',
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Divider(color: Colors.grey),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MovieCountContainer extends StatelessWidget {
  const MovieCountContainer({
    super.key,
    required this.color,
    required this.subtitle,
    required this.count,
    required this.icon,
  });

  final Color color;
  final String subtitle;
  final String count;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      width: 120,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
      child: Padding(
        padding: context.padding.low,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white),
            MiniTitle(subtitle: subtitle, color: Colors.white),
            MiniTitle(subtitle: count, color: Colors.white)
          ],
        ),
      ),
    );
  }
}
