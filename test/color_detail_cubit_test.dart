import 'dart:ui';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:solid_test_task/core/extension/hex_color.dart';
import 'package:solid_test_task/domain/model/color_model.dart';
import 'package:solid_test_task/domain/repository/color_repository.dart';
import 'package:solid_test_task/presentation/color_detail/cubit/color_detail_cubit.dart';

import 'color_detail_cubit_test.mocks.dart';

@GenerateMocks([ColorRepository])
void main() {
  late ColorDetailCubit colorDetailCubit;
  late MockColorRepository colorRepository;

  setUp(() {
    colorRepository = MockColorRepository();
    colorDetailCubit = ColorDetailCubit(colorRepository: colorRepository);
  });

  tearDown(() {
    colorDetailCubit.close();
  });

  test('Cubit in initial state', () {
    expect(
      colorDetailCubit.state,
      const ColorDetailState(backgroundColor: null, initialHexString: null),
    );
  });

  blocTest<ColorDetailCubit, ColorDetailState>(
    'emits state with initial hex, and background color',
    build: () {
      return colorDetailCubit;
    },
    act: (cubit) {
      cubit.setInitialColors(const ColorModel(hexString: '#ffffffff'));
    },
    expect:
        () => [
          const ColorDetailState(
            backgroundColor: Color(0xffffffff),
            initialHexString: '#ffffffff',
          ),
        ],
  );

  blocTest<ColorDetailCubit, ColorDetailState>(
    'emits state with new background color, initial hex should be same',
    build: () {
      colorDetailCubit.setInitialColors(
        const ColorModel(hexString: '#ffffffff'),
      );
      return colorDetailCubit;
    },
    act: (cubit) {
      cubit.generateRandomColors();
    },
    expect:
        () => [
          predicate<ColorDetailState>(
            (state) =>
                state.backgroundColor != const Color(0xffffffff) &&
                state.initialHexString == '#ffffffff',
          ),
        ],
  );

  blocTest<ColorDetailCubit, ColorDetailState>(
    'emits state with navigate back after deleting',
    build: () {
      colorDetailCubit.setInitialColors(
        const ColorModel(hexString: '#ffffffff'),
      );

      when(
        colorRepository.deleteColor(colorDetailCubit.state.initialHexString),
      ).thenAnswer((_) async => []);

      return colorDetailCubit;
    },
    act: (cubit) {
      cubit.deleteColor();
    },
    expect:
        () => [
          const ColorDetailState(
            navigateBack: true,
            backgroundColor: Color(0xffffffff),
            initialHexString: '#ffffffff',
          ),
        ],
  );

  blocTest<ColorDetailCubit, ColorDetailState>(
    'emits state with error after deleting error',
    build: () {
      colorDetailCubit.setInitialColors(
        const ColorModel(hexString: '#ffffffff'),
      );

      when(
        colorRepository.deleteColor(colorDetailCubit.state.initialHexString),
      ).thenThrow(Exception('Cannot delete color'));

      return colorDetailCubit;
    },
    act: (cubit) {
      cubit.deleteColor();
    },
    expect:
        () => [
          const ColorDetailState(
            backgroundColor: Color(0xffffffff),
            initialHexString: '#ffffffff',
            error: 'Exception: Cannot delete color',
          ),
        ],
  );

  blocTest<ColorDetailCubit, ColorDetailState>(
    'emits state with navigate back after editing color',
    build: () {
      const colorModel = ColorModel(hexString: '#ffffffff');
      colorDetailCubit.setInitialColors(
        colorModel
      );
      when(
        colorRepository.editColor(
          oldHexString: colorDetailCubit.state.initialHexString,
          colorMap: colorModel.toMap()
        ),
      ).thenAnswer((_) async => []);

      return colorDetailCubit;
    },
    act: (cubit) {
      cubit.editColor();
    },
    expect:
        () => [
          const ColorDetailState(
            navigateBack: true,
            backgroundColor: Color(0xffffffff),
            initialHexString: '#ffffffff',
          ),
        ],
  );

  blocTest<ColorDetailCubit, ColorDetailState>(
    'emits state with error after editing error color',
    build: () {
      const colorModel = ColorModel(hexString: '#ffffffff');
      colorDetailCubit.setInitialColors(
          colorModel
      );

      when(
        colorRepository.editColor(
            oldHexString: colorDetailCubit.state.initialHexString,
            colorMap: colorModel.toMap(),
        ),
      ).thenThrow(Exception('Cannot edit color'));

      return colorDetailCubit;
    },
    act: (cubit) {
      cubit.editColor();
    },
    expect:
        () => [
      const ColorDetailState(
        error: 'Exception: Cannot edit color',
        backgroundColor: Color(0xffffffff),
        initialHexString: '#ffffffff',
      ),
    ],
  );

  blocTest<ColorDetailCubit, ColorDetailState>(
    'emits state with error after editing error color that is null',
    build: () {
      const colorModel = ColorModel(hexString: '#ffffffff');

      when(
        colorRepository.editColor(
          oldHexString: colorDetailCubit.state.initialHexString,
          colorMap: colorModel.toMap(),
        ),
      );

      return colorDetailCubit;
    },
    act: (cubit) {
      cubit.editColor();
    },
    expect:
        () => [
      const ColorDetailState(
        error: 'Background color do not exists',
        backgroundColor: null,
        initialHexString: null,
      ),
    ],
  );

  blocTest<ColorDetailCubit, ColorDetailState>(
    'emits state with navigateBack == null',
    build: () {
      return colorDetailCubit;
    },
    act: (cubit) {
      cubit.clearNavigation();
    },
    expect:
        () => [
      predicate<ColorDetailState>(
            (state) =>
        state.navigateBack == null,
      ),
    ],
  );
}
