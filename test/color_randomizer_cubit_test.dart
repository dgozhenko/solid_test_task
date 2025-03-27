import 'dart:ui';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:solid_test_task/core/extension/hex_color.dart';
import 'package:solid_test_task/domain/repository/color_repository.dart';
import 'package:solid_test_task/presentation/color_randomizer/cubit/color_randomizer_cubit.dart';
import 'package:sqflite/sqflite.dart';

import 'color_randomizer_cubit_test.mocks.dart';

@GenerateMocks([ColorRepository])
void main() {
  late ColorRandomizerCubit colorRandomizerCubit;
  late MockColorRepository colorRepository;

  setUp(() {
    colorRepository = MockColorRepository();
    colorRandomizerCubit = ColorRandomizerCubit(
      colorRepository: colorRepository,
    );
  });

  tearDown(() {
    colorRandomizerCubit.close();
  });

  test('Cubit in initial state', () {
    expect(
      colorRandomizerCubit.state,
      const ColorRandomizerState(
        backgroundColor: Color(0xffffffff),
        textColor: Color(0xff000000),
        firstColorGenerated: false,
      ),
    );
  });

  blocTest<ColorRandomizerCubit, ColorRandomizerState>(
    'emits state with new background color, and firstColorGenerated',
    build: () {
      return colorRandomizerCubit;
    },
    act: (cubit) {
      cubit.generateRandomColors();
    },
    expect:
        () => [
          predicate<ColorRandomizerState>(
            (state) =>
                state.backgroundColor != const Color(0xffffffff) &&
                state.firstColorGenerated == true,
          ),
        ],
  );

  blocTest<ColorRandomizerCubit, ColorRandomizerState>(
    'emits state with showDatabaseSuccess == true when color saved',
    build: () {
      final colorMap = {
        'hexString': colorRandomizerCubit.state.backgroundColor.toHex(),
      };
      when(
        colorRepository.insertColor(colorMap),
      ).thenAnswer((_) => Future.value());

      return colorRandomizerCubit;
    },
    act: (cubit) {
      cubit.saveColor();
    },
    expect:
        () => [
          predicate<ColorRandomizerState>(
            (state) => state.showDatabaseSaveSuccess ?? false,
          ),
        ],
  );

  blocTest<ColorRandomizerCubit, ColorRandomizerState>(
    'emits state with error message when database issue',
    build: () {
      final colorMap = {
        'hexString': colorRandomizerCubit.state.backgroundColor.toHex(),
      };
      when(
        colorRepository.insertColor(colorMap),
      ).thenThrow(Exception('Unknown Database Error'));

      return colorRandomizerCubit;
    },
    act: (cubit) {
      cubit.saveColor();
    },
    expect:
        () => [
          predicate<ColorRandomizerState>(
            (state) => state.error == 'Exception: Unknown Database Error',
          ),
        ],
  );

  blocTest<ColorRandomizerCubit, ColorRandomizerState>(
    'emits state with error == null',
    build: () {
      return colorRandomizerCubit;
    },
    act: (cubit) {
      cubit.clearErrorScaffoldMessage();
    },
    expect:
        () => [
      predicate<ColorRandomizerState>(
            (state) => state.error == null,
      ),
    ],
  );

  blocTest<ColorRandomizerCubit, ColorRandomizerState>(
    'emits state with showDatabaseSaveSuccess == null',
    build: () {
      return colorRandomizerCubit;
    },
    act: (cubit) {
      cubit.clearDatabaseSaveToast();
    },
    expect:
        () => [
      predicate<ColorRandomizerState>(
            (state) => state.showDatabaseSaveSuccess == null,
      ),
    ],
  );
}
