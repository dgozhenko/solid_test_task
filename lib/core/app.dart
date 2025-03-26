import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_test_task/presentation/bottom_navigation/main_bottom_navigation_page.dart';
import 'package:solid_test_task/presentation/color_randomizer/cubit/color_randomizer_cubit.dart';

/// MaterialApp class implementation
class App extends StatelessWidget {
  /// Constructor of MaterialApp
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorRandomizerCubit>(
          create: (_) => ColorRandomizerCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Color Randomizer',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MainBottomNavigationPage(),
      ),
    );
  }
}
