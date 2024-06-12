import 'package:chatgpt_app/presentation/product/widgets/loading/custom_appbar.dart';
import 'package:flutter/material.dart';

class TopRatedPage extends StatefulWidget {
  const TopRatedPage({super.key});

  @override
  State<TopRatedPage> createState() => _TopRatedPageState();
}

class _TopRatedPageState extends State<TopRatedPage> {
  final ScrollController _scrollController = ScrollController();
  int pageNum = 1;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        pageNum = pageNum + 1;
      });
      //homeBloc.add(HomeTopRatedDetailEvent(pageNum: pageNum));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          onPressedBack: () {
            Navigator.pop(context);
          },
          title: 'Top Rated'.toUpperCase(),
          icon: Icons.arrow_back_ios,
          iconSearch: null,
          preferredSize: const Size.fromHeight(kToolbarHeight),
          onPressed: () {},
          child: const SizedBox.shrink()),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              controller: _scrollController,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.blueGrey,
                );
              },
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
