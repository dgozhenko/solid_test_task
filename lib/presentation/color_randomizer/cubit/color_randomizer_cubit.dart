import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solid_test_task/core/extension/hex_color.dart';
import 'package:solid_test_task/domain/model/color.dart';
import 'package:solid_test_task/domain/repository/color_repository.dart';

part 'color_randomizer_cubit.freezed.dart';
part 'color_randomizer_state.dart';

/// Color Randomizer Cubit contains business logic for Color Randomizer Page
class ColorRandomizerCubit extends Cubit<ColorRandomizerState> {
  /// color repository for storing colors
  final ColorRepository colorRepository;

  /// Constructor with initial values
  ColorRandomizerCubit({required this.colorRepository})
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
  /// save color to database
  Future<void> saveColor() async {
    try {
      final hexString = state.backgroundColor.toHex();

      await colorRepository.insertColor(
        ColorModel(hexString: hexString).toMap(),
      );
      emit(state.copyWith(showDatabaseSaveSuccess: true));
      await Future.delayed(const Duration(seconds: 2)).then((_) {
        clearDatabaseSaveToast();
      });
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
  /// clear database save toast
  void clearDatabaseSaveToast() {
    emit(state.copyWith(showDatabaseSaveSuccess: null));
  }
}
