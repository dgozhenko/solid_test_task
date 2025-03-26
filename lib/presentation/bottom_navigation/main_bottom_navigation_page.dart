import 'package:flutter/material.dart';
import 'package:solid_test_task/presentation/color_gallery/color_gallery_page.dart';
import 'package:solid_test_task/presentation/color_randomizer/color_randomizer_page.dart';

/// Bottom navigation page of app
/// contains navigation between [/color_randomizer, /color_gallery]
class MainBottomNavigationPage extends StatefulWidget {
  /// Constructor
  const MainBottomNavigationPage({super.key});

  @override
  State<MainBottomNavigationPage> createState() =>
      _MainBottomNavigationPageState();
}

class _MainBottomNavigationPageState extends State<MainBottomNavigationPage> {
  int currentBottomNavigationIndex = 0;
  final bodies = [
    const ColorRandomizerPage(),
    const ColorGalleryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentBottomNavigationIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.color_lens_outlined),
            label: 'Randomizer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections),
            label: 'Gallery',
          ),
        ],
        onTap: (index) {
          setState(() {
            currentBottomNavigationIndex = index;
          });
        },
      ),
      body: bodies[currentBottomNavigationIndex],
    );
  }
}
