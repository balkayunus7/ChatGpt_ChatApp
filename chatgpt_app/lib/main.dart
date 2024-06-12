import 'package:chatgpt_app/core/initialErrorApp.dart';
import 'package:chatgpt_app/core/setup_injector.dart';
import 'package:chatgpt_app/application/home/home_bloc/home_bloc.dart';
import 'package:chatgpt_app/presentation/onboarding/onboarding_main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  bool injected = false;

  await dotenv.load();
  injected = await setupApplicationInjector();
  if (!injected) return runApp(const InitialErrorApp());
  runApp(BlocProvider(
    create: (context) => HomeBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favori Kitaplarım',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.deepPurple),
      ),
      home: const OnBoardingMainPage(),
    );
  }
}
