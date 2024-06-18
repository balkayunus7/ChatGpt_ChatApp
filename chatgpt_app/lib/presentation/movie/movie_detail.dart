import 'package:chatgpt_app/application/movie_detail_cubit/movie_detail_cubit.dart';
import 'package:chatgpt_app/application/movie_detail_cubit/movie_detail_state.dart';
import 'package:chatgpt_app/core/injector/setup_injector.dart';
import 'package:chatgpt_app/core/models/movie.dart';
import 'package:chatgpt_app/presentation/product/widgets/texts/subtitle_text.dart';
import 'package:chatgpt_app/presentation/product/widgets/texts/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({super.key, required this.movie});

  final Results movie;

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return getIt<MovieDetailCubit>()..addFetched(widget.movie.id!);
      },
      child: BlocBuilder<MovieDetailCubit, MovieDetailState>(
        builder: (context, state) {
          if (state.movie.backdropPath == null ||
              state.movie.posterPath == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              title: TitleText(
                  title: state.movie.title.toString(), color: Colors.white),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500/${state.movie.backdropPath}',
                        fit: BoxFit.cover,
                      ),
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
                                      child: TitleText(
                                          title: widget.movie.title.toString(),
                                          color: Colors.white)),
                                  Padding(
                                    padding: context.padding.horizontalLow,
                                    child: SubtitleText(
                                        subtitle:
                                            state.movie.tagline.toString(),
                                        color: Colors.grey),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: context.padding.low,
                                        child: MiniTitle(
                                            subtitle: widget.movie.releaseDate
                                                .toString(),
                                            color: Colors.grey),
                                      ),
                                      Padding(
                                        padding: context.padding.horizontalLow,
                                        child: const MiniTitle(
                                            subtitle: 'TRAILER',
                                            color: Colors.white),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w500/${state.movie.posterPath}',
                                width: 90,
                                fit: BoxFit.fitWidth,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: context.padding.low,
                          child: SubtitleText(
                              subtitle: widget.movie.overview.toString(),
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
                                    subtitle: 'Popularity',
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: context.padding.low,
                                  child: const TitleText(
                                    title: '*****',
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: context.padding.low,
                                  child: TitleText(
                                    title: widget.movie.voteAverage.toString(),
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: context.padding.horizontalLow,
                          child: const TitleText(
                              title: 'Counts', color: Colors.grey),
                        ),
                        Padding(
                          padding: context.padding.low,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MovieCountContainer(
                                color: Colors.green,
                                subtitle: 'Members',
                                count: state.movie.voteCount.toString(),
                                icon: Icons.remove_red_eye,
                              ),
                              MovieCountContainer(
                                color: Colors.grey,
                                subtitle: 'Reviews',
                                count: state.movie.popularity.toString(),
                                icon: Icons.bookmark,
                              ),
                              MovieCountContainer(
                                color: Colors.blueAccent,
                                subtitle: 'Lists',
                                count: state.movie.popularity.toString(),
                                icon: Icons.list_alt,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: context.padding.low,
                          child: const TitleText(
                              title: 'Genre', color: Colors.grey),
                        ),
                        GenreWidget(state: state),
                        const Divider(color: Colors.grey),
                        Padding(
                          padding: context.padding.low,
                          child: const TitleText(
                              title: 'Cast', color: Colors.grey),
                        ),
                        const CastWidget(),
                        const Divider(color: Colors.grey),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class GenreWidget extends StatelessWidget {
  const GenreWidget({
    super.key,
    required this.state,
  });
  final MovieDetailState state;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: state.movie.genres?.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: context.padding.low,
            child: MiniTitle(
                subtitle: state.movie.genres![index].name!,
                color: Colors.white),
          );
        },
      ),
    );
  }
}

class CastWidget extends StatelessWidget {
  const CastWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                        subtitle: 'Timothée Chal', color: Colors.white),
                  ),
                ],
              ),
            );
          },
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
