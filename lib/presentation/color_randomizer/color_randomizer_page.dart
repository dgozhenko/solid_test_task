import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_test_task/presentation/color_randomizer/cubit/color_randomizer_cubit.dart';

/// Color Randomizer Page that generate new color
/// on screen tap, with ability to save color into local database
class ColorRandomizerPage extends StatefulWidget {
  /// Constructor
  const ColorRandomizerPage({super.key});

  @override
  State<ColorRandomizerPage> createState() => _ColorRandomizerPageState();
}

class _ColorRandomizerPageState extends State<ColorRandomizerPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ColorRandomizerCubit, ColorRandomizerState>(
      listener: (_, _) {},
      builder: (context, state) {
        return InkWell(
          onTap: () {
            context.read<ColorRandomizerCubit>().generateRandomColors();
          },
          onLongPress: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Color Saved To Gallery')),
            );
          },
          child: AnimatedContainer(
            decoration: BoxDecoration(color: state.backgroundColor),
            duration: const Duration(milliseconds: 300),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Hey there',
                          style: TextStyle(
                            color: state.textColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        AnimatedOpacity(
                          opacity:
                             state.showTipText
                                  ? 1.0
                                  : 0.0,
                          duration: const Duration(milliseconds: 300),
                          child: Text(
                            '(Try long tap color if you like it)',
                            style: TextStyle(
                              color: state.textColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
