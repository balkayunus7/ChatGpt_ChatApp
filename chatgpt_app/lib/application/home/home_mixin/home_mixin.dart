import 'package:chatgpt_app/presentation/detail/toprated_page.dart';
import 'package:chatgpt_app/presentation/home/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

mixin HomeMixin on State<HomePage> {
  void toTopRatedPage() {
    context.route.navigateToPage(const TopRatedPage());
  }
}
