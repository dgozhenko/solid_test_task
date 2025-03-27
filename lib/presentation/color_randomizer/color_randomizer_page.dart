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
      listener: (context, state) {
        if (state.showDatabaseSaveSuccess == null) return;
        if (state.showDatabaseSaveSuccess == false) return;
        if (state.error != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error ?? '')));

          return;
        }

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Color saved to database')),
        );
      },
      builder: (context, state) {
        return InkWell(
          onTap: () {
            context.read<ColorRandomizerCubit>().generateRandomColors();
          },
          onLongPress: () async {
            await context.read<ColorRandomizerCubit>().saveColor();
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
                        Text(
                          state.showTipText
                              ? '(Try long tap color if you like it)'
                              : '(Tap to generate random color)',
                          style: TextStyle(
                            color: state.textColor,
                            fontSize: 16,
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
