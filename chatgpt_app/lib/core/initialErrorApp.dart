import 'package:flutter/material.dart';

class InitialErrorApp extends StatefulWidget {
  const InitialErrorApp({super.key});

  @override
  State<InitialErrorApp> createState() => _InitialErrorAppState();
}

class _InitialErrorAppState extends State<InitialErrorApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title:' env.APP_TITLE',
      home: _InitialErrorPage(),
    );
  }
}

class _InitialErrorPage extends StatelessWidget {
  const _InitialErrorPage();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: const AMakronlineProduct(),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(
              Icons.abc,
              color: Colors.red,
              size: 132,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: screenWidth * 0.75,
              child: const Text(
                'context.tr.UNEXPECTED_FAILURE_MESSAGE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: screenWidth * 0.40,
              height: 46,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 8.0,
                  bottom: 8.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: Colors.red,
                ),
                child: const Text(
                  'context.tr.CONTACT_BTN,',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AMakronlineProduct extends StatelessWidget {
  const AMakronlineProduct({super.key});

  @override
  Widget build(BuildContext context) {
    const translatedText = ' context.tr.A_MAKRONLINE_PRODUCT';
    const textColor = Colors.red;

    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          translatedText,
          style: TextStyle(
            color: textColor,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        InkWell(
          child: Text(
            translatedText,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          translatedText,
          style: TextStyle(),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
