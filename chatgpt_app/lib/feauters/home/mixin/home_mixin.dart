import 'package:chatgpt_app/feauters/detail/populer_page_detail.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../detail/toprated_page.dart';
import '../../detail/upcoming_detail_page.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../ui/home_page.dart';

mixin HomeMixin on State<HomePage> {
  HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitalEvent());
  }

  void toTopRatedPage() {
    context.route.navigateToPage(const TopRatedPage());
  }

  void toPopulerPage() {
    context.route.navigateToPage(const PopulerPage());
  }

  void toUpcomingPage() {
    context.route.navigateToPage(const UpComingPage());
  }
}
