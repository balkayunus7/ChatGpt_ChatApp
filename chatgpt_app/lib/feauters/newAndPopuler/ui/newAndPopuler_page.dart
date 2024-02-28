import 'package:chatgpt_app/feauters/newAndPopuler/bloc/new_bloc.dart';
import 'package:chatgpt_app/feauters/newAndPopuler/bloc/new_state.dart';
import 'package:chatgpt_app/feauters/newAndPopuler/ui/detail/newAndPopuler_widget.dart';
import 'package:chatgpt_app/product/widgets/loading/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../product/constants/string_constants.dart';
import '../../../product/widgets/loading/custom_loading_scaffold.dart';
import '../mixin/newAndPopMixin.dart';

class NewAndPopulerPage extends StatefulWidget {
  const NewAndPopulerPage({super.key});

  @override
  State<NewAndPopulerPage> createState() => _NewAndPopulerPageState();
}

class _NewAndPopulerPageState extends State<NewAndPopulerPage>
    with NewAndPopMixin {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewPopBloc, NewPopState>(
      listener: (context, state) {},
      bloc: newPopBloc,
      builder: (context, state) {
        final currentState = state;
        switch (currentState.runtimeType) {
          case NewPopInital:
            return const LoadingScaffold();
          case NewPopMovieState:
            final homeNewPopState = currentState as NewPopMovieState;
            return Scaffold(
              appBar: CustomAppBar(
                onPressedBack: () {},
                title: StringConstants.newAndPopuler,
                icon: null,
                iconSearch: Icons.search,
                preferredSize: const Size.fromHeight(kToolbarHeight),
                onPressed: () {},
                child: const SizedBox.shrink(),
              ),
              body: Expanded(
                child: ListView.builder(
                  itemCount: homeNewPopState.moviePopNewList.results!.length,
                  itemBuilder: (context, index) {
                    return NewAndPopulerWidget(
                      populerImage: homeNewPopState
                          .moviePopNewList.results![index].backdropPath
                          .toString(),
                      populerTitle: homeNewPopState
                          .moviePopNewList.results![index].title
                          .toString(),
                      populerDateDay: homeNewPopState
                          .moviePopNewList.results![index].releaseDate
                          .toString()
                          .substring(8, 10),
                      populerDescription: homeNewPopState
                          .moviePopNewList.results![index].overview
                          .toString(),
                      populerDateMonth: toMonth(homeNewPopState
                          .moviePopNewList.results![index].releaseDate
                          .toString()
                          .substring(5, 7)),
                      populerDate:
                          "${homeNewPopState.moviePopNewList.results![index].releaseDate.toString().substring(0, 4)} ${toMonth(homeNewPopState.moviePopNewList.results![index].releaseDate.toString().substring(5, 7))} ${homeNewPopState.moviePopNewList.results![index].releaseDate.toString().substring(8, 10)}",
                    );
                  },
                ),
              ),
            );

          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
