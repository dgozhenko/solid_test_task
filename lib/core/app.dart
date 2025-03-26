import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_test_task/core/helper/database_helper.dart';
import 'package:solid_test_task/data/repository/color_repository_impl.dart';
import 'package:solid_test_task/presentation/bottom_navigation/main_bottom_navigation_page.dart';
import 'package:solid_test_task/presentation/color_detail/color_detail_page.dart';
import 'package:solid_test_task/presentation/color_gallery/cubit/color_gallery_cubit.dart';
import 'package:solid_test_task/presentation/color_randomizer/cubit/color_randomizer_cubit.dart';

/// MaterialApp class implementation
class App extends StatelessWidget {
  /// Constructor of MaterialApp
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final databaseHelper = DatabaseHelper.instance;

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => ColorRepositoryImpl(databaseHelper: databaseHelper),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ColorRandomizerCubit>(
            create:
                (context) => ColorRandomizerCubit(
                  colorRepository: context.read<ColorRepositoryImpl>(),
                ),
          ),
          BlocProvider<ColorGalleryCubit>(
            create:
                (context) => ColorGalleryCubit(
                  colorRepository: context.read<ColorRepositoryImpl>(),
                ),
          ),
        ],
        child: MaterialApp(
          title: 'Color Randomizer',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home: const MainBottomNavigationPage(),
          routes: {
            ColorDetailPage.routeName: (_) => const ColorDetailPage()
          },
        ),
      ),
    );
  }
}
