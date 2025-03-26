import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_randomizer_cubit.freezed.dart';
part 'color_randomizer_state.dart';

/// Color Randomizer Cubit contains business logic for Color Randomizer Page
class ColorRandomizerCubit extends Cubit<ColorRandomizerState> {
  /// Constructor with initial values
  ColorRandomizerCubit()
    : super(
        const ColorRandomizerState(
          backgroundColor: Color(0xffffffff),
          textColor: Color(0xff000000),
          showTipText: false,
        ),
      );

  /// generates random background color and then calculates luminance
  /// in order to change text color
  void generateRandomColors() {
    const luminanceThreshold = 0.16;
    const maxHexValueForColor = 0xffffffff;
    final randomColor = Color(Random().nextInt(maxHexValueForColor));

    final luminanceCalculatedTextColor =
        randomColor.computeLuminance() > luminanceThreshold
            ? Colors.black
            : Colors.white;
    emit(
      state.copyWith(
        backgroundColor: randomColor,
        textColor: luminanceCalculatedTextColor,
        showTipText: true,
      ),
    );
  }
}
