import 'package:flutter/material.dart';
import 'package:solid_test_task/presentation/bottom_navigation/main_bottom_navigation_page.dart';

/// MaterialApp class implementation
class App extends StatelessWidget {
  /// Constructor of MaterialApp
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Randomizer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MainBottomNavigationPage(),
    );
  }
}
