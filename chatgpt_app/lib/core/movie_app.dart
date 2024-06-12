import 'package:chatgpt_app/core/setup_injector.dart';
import 'package:chatgpt_app/application/home/home_bloc/home_bloc.dart';
import 'package:chatgpt_app/presentation/home/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MakromusicApp extends StatefulWidget {
  const MakromusicApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MakromusicAppState createState() => _MakromusicAppState();
}

class _MakromusicAppState extends State<MakromusicApp>
    with WidgetsBindingObserver {
  final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<HomeBloc>()),
      ],
      child: MaterialApp(
        title: 'Makromusic',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.deepPurple),
        ),
        home: const HomePage(),
      ),
    );
  }
}
