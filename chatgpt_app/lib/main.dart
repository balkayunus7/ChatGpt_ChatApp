import 'package:chatgpt_app/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'home/ui/home_page.dart';

Future<void> main() async {
  await dotenv.load();
  runApp( BlocProvider(
    create: (context) => HomeBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favori Kitaplarım',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}
