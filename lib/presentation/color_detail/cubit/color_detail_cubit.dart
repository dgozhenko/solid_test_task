import 'dart:math';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solid_test_task/core/extension/hex_color.dart';
import 'package:solid_test_task/domain/model/color_model.dart';
import 'package:solid_test_task/domain/repository/color_repository.dart';

part 'color_detail_cubit.freezed.dart';

part 'color_detail_state.dart';

/// Color detail cubit with ability to edit, delete color
class ColorDetailCubit extends Cubit<ColorDetailState> {
  final ColorRepository colorRepository;

  /// constructor
  ColorDetailCubit({required this.colorRepository})
      : super(
    const ColorDetailState(backgroundColor: null, initialHexString: null),
  );

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


    emit(
      state.copyWith(
        backgroundColor: randomColor,
      ),
    );
  }

  Future<void> deleteColor() async {
    try {
      if (state.initialHexString == null) return;
      await colorRepository.deleteColor(state.initialHexString!);
      emit(state.copyWith(navigateBack: true));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> editColor() async {
    try {
      if (state.backgroundColor == null) {
        emit(state.copyWith(error: 'Background color do not exists'));
      }
      if (state.initialHexString == null) {
        emit(state.copyWith(error: 'Initial color do not exists'));
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

  void clearNavigation() {
    emit(state.copyWith(navigateBack: null));
  }
}
