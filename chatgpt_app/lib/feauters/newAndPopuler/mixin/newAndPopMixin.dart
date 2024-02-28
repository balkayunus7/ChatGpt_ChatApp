import 'package:flutter/material.dart';
import '../bloc/new_bloc.dart';
import '../bloc/new_event.dart';
import '../ui/newAndPopuler_page.dart';

mixin NewAndPopMixin on State<NewAndPopulerPage> {
  final NewPopBloc newPopBloc = NewPopBloc();
  @override
  void initState() {
    super.initState();
    newPopBloc.add(NewPopInitalEvent());
  }

  String toMonth(String monthIndex) {
    switch (monthIndex) {
      case '01':
        return 'Jan';
      case '02':
        return 'Feb';
      case '03':
        return 'Mar';
      case '04':
        return 'Apr';
      case '05':
        return 'May';
      case '06':
        return 'Jun';
      case '07':
        return 'Jul';
      case '08':
        return 'Aug';
      case '09':
        return 'Sep';
      case '10':
        return 'Oct';
      case '11':
        return 'Nov';
      case '12':
        return 'Dec';
      default:
        return '';
    }
  }
}
