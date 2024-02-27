import 'package:chatgpt_app/feauters/newAndPopuler/bloc/new_bloc.dart';
import 'package:chatgpt_app/feauters/newAndPopuler/bloc/new_event.dart';
import 'package:chatgpt_app/feauters/newAndPopuler/bloc/new_state.dart';
import 'package:chatgpt_app/feauters/newAndPopuler/ui/detail/newAndPopuler_widget.dart';
import 'package:chatgpt_app/product/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/constants/string_constants.dart';

class NewAndPopulerPage extends StatefulWidget {
  const NewAndPopulerPage({super.key});

  @override
  State<NewAndPopulerPage> createState() => _NewAndPopulerPageState();
}

class _NewAndPopulerPageState extends State<NewAndPopulerPage> {
  final NewPopBloc newPopBloc = NewPopBloc();
  @override
  void initState() {
    super.initState();
    newPopBloc.add(NewPopInitalEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewPopBloc, NewPopState>(
      listener: (context, state) {},
      bloc: newPopBloc,
      builder: (context, state) {
        final currentState = state;
        switch (currentState.runtimeType) {
          case NewPopInital:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case NewPopMovieState:
            final homeNewPopState = currentState as NewPopMovieState;
            return Scaffold(
              appBar: CustomAppBar(
                onPressedBack: () {},
                title: StringConstants.newAndPopuler,
                icon: null,
                iconSearch: Icons.search,
                preferredSize: const Size.fromHeight(kToolbarHeight),
                onPressed: () {
                },
                child: const SizedBox.shrink(),
              ),
              body: Expanded(
                child: ListView.builder(
                  itemCount: homeNewPopState.moviePopNewList.results!.length,
                  itemBuilder: (context, index) {
                    return NewAndPopulerWidget(
                      populerImage:
                          homeNewPopState.moviePopNewList.results![index].backdropPath
                              .toString(),
                      populerTitle: homeNewPopState
                          .moviePopNewList.results![index].title
                          .toString(),
                      populerDateDay: '07',
                      populerDescription: homeNewPopState
                          .moviePopNewList.results![index].overview
                          .toString(),
                      populerDateMonth: 'Mar',
                      populerDate: homeNewPopState
                          .moviePopNewList.results![index].releaseDate
                          .toString(),
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
