import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solid_test_task/core/extension/hex_color.dart';
import 'package:solid_test_task/domain/model/color_model.dart';
import 'package:solid_test_task/domain/repository/color_repository.dart';
import 'package:sqflite/sqflite.dart';

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
          firstColorGenerated: false,
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
        firstColorGenerated: true,
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
    } on DatabaseException catch (e) {
      String databaseError = 'Unknown Database Error';
      if (e.isUniqueConstraintError()) {
        databaseError = 'Color already saved, try save another';
      }
      emit(state.copyWith(error:databaseError));
    }
    catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
  /// clear error scaffold message from state
  void clearErrorScaffoldMessage() {
    emit(state.copyWith(error: null));
  }

  /// clear database save toast
  void clearDatabaseSaveToast() {
    emit(state.copyWith(showDatabaseSaveSuccess: null));
  }
}
