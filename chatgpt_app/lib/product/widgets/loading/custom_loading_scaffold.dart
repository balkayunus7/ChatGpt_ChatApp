import 'package:flutter/material.dart';
import 'custom_loading.dart';

class LoadingScaffold extends StatelessWidget {
  const LoadingScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LoadingWidget(),
      ),
    );
  }
}
