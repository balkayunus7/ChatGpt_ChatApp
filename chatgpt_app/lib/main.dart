import 'package:chatgpt_app/feauters/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'feauters/home/ui/navigation_page.dart';

Future<void> main() async {
  await dotenv.load();
  runApp( BlocProvider(
    create: (context) => HomeBloc(),
    child:  MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favori Kitaplarım',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.deepPurple),
      ),
      home: NavigaitonPage(),
    );
  }
}