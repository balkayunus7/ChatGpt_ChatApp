import 'package:chatgpt_app/application/home_bloc/home_bloc.dart';
import 'package:chatgpt_app/presentation/detail/toprated_page.dart';
import 'package:chatgpt_app/presentation/home/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

mixin HomeMixin on State<HomePage> {
  @override
  void initState() {
    context.read<HomeBloc>().addFetched();
    super.initState();
  }

  void toTopRatedPage() {
    context.route.navigateToPage(const TopRatedPage());
  }
}
