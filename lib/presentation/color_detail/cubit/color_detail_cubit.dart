// ignore_for_file: avoid_non_null_assertion
import 'dart:math';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solid_test_task/core/extension/hex_color.dart';
import 'package:solid_test_task/domain/model/color_model.dart';
import 'package:solid_test_task/domain/repository/color_repository.dart';

part 'color_detail_cubit.freezed.dart';
part 'color_detail_state.dart';

/// Color detail cubit with ability to edit, delete color
class ColorDetailCubit extends Cubit<ColorDetailState> {
  /// color repository for accessing colors database
  final ColorRepository colorRepository;

  /// constructor
  ColorDetailCubit({required this.colorRepository})
    : super(
        const ColorDetailState(backgroundColor: null, initialHexString: null),
      );

  /// store initial colors from navigation args
  void setInitialColors(ColorModel colorModel) {
    final color = HexColor.fromHex(colorModel.hexString);
    emit(
      state.copyWith(
        backgroundColor: color,
        initialHexString: colorModel.hexString,
      ),
    );
  }

  /// generates random background color and then calculates luminance
  /// in order to change text color
  void generateRandomColors() {
    const maxHexValueForColor = 0xffffffff;
    final randomColor = Color(Random().nextInt(maxHexValueForColor));

    emit(state.copyWith(backgroundColor: randomColor));
  }

  /// delete color from database
  Future<void> deleteColor() async {
    try {
      if (state.initialHexString == null) return;
      await colorRepository.deleteColor(state.initialHexString!);
      emit(state.copyWith(navigateBack: true));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  /// edit color in database
  Future<void> editColor() async {
    try {
      if (state.backgroundColor == null) {
        emit(state.copyWith(error: 'Background color do not exists'));

        return;
      }
      if (state.initialHexString == null) {
        emit(state.copyWith(error: 'Initial color do not exists'));

        return;
      }
      final colorModel = ColorModel(hexString: state.backgroundColor!.toHex());
      await colorRepository.editColor(
        oldHexString: state.initialHexString ?? '',
        colorMap: colorModel.toMap(),
      );
      emit(state.copyWith(navigateBack: true));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  /// clear cubit navigation after navigation
  void clearNavigation() {
    emit(state.copyWith(navigateBack: null));
  }
}
