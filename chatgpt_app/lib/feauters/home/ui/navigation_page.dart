
import 'package:chatgpt_app/feauters/home/ui/home_page.dart';
import 'package:chatgpt_app/feauters/newAndPopuler/ui/newAndPopuler_page.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../../product/constants/color_constants.dart';

class NavigaitonPage extends StatefulWidget {
  const NavigaitonPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavigaitonPageState createState() => _NavigaitonPageState();
}

class _NavigaitonPageState extends State<NavigaitonPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const NewAndPopulerPage(),
    const Center(
      child: Text('Favori'),
    ),
    const Center(
      child: Text('Profil'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: ColorConstants.primeryFilled,
        color: ColorConstants.primeryFilled,
        animationDuration: const Duration(milliseconds: 300),
        height: 70,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          Icon(Icons.home, size: 30),
          Icon(Icons.video_collection_outlined, size: 30),
          Icon(Icons.favorite, size: 30),
          Icon(Icons.person, size: 30),
        ],
      ),
    );
  }
}
