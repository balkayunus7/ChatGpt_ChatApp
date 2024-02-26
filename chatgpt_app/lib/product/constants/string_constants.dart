import 'package:flutter/material.dart';

@immutable
class StringConstants {
  const StringConstants._();

  // Home
  static const String homeTitle = 'Cinefy';
  static const String homeSearch = 'Search ';

  // Favorites
  static const String favoriTitle = 'Favoriler';

  // Snack Bar
  static const String hintText = 'Series, Dramas, Action, etc.';
  static const String trendTitle = 'Now Playing';
  static const String seeAll = 'See All';
  static const String topRated = 'Top Rated';

  // Book Detail
  static const String populer = 'Populer';
  static const String onComing = 'On Coming ';
  static const String noResult = 'No Results:';
  static const String authors = 'Authors:  ';
  static const String publisher = 'Publisher:  ';

  // Errors
  static const String errorLoadingBooks = 'Failed to load books';
}