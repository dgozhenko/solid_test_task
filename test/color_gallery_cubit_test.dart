// ignore_for_file: avoid_late_keyword
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:solid_test_task/domain/model/color_model.dart';
import 'package:solid_test_task/domain/repository/color_repository.dart';
import 'package:solid_test_task/presentation/color_gallery/cubit/color_gallery_cubit.dart';

import 'color_gallery_cubit_test.mocks.dart';

@GenerateMocks([ColorRepository])
void main() {
  late ColorGalleryCubit colorGalleryCubit;
  late MockColorRepository colorRepository;

  setUp(() {
    colorRepository = MockColorRepository();
    colorGalleryCubit = ColorGalleryCubit(colorRepository: colorRepository);
  });

  tearDown(() {
    colorGalleryCubit.close();
  });

  test('Cubit in initial state', () {
    expect(
      colorGalleryCubit.state,
      const ColorGalleryState(colors: [], loading: false),
    );
  });

  blocTest<ColorGalleryCubit, ColorGalleryState>(
    '[getColors] loading -> colors, loading == false',
    build: () {
      when(
        colorRepository.getColors(),
      ).thenAnswer((_) async => [const ColorModel(hexString: '#ffffffff')]);

      return colorGalleryCubit;
    },
    act: (cubit) {
      cubit.getColors();
    },
    expect:
        () => [
          const ColorGalleryState(loading: true, colors: []),
          const ColorGalleryState(
            loading: false,
            colors: [ColorModel(hexString: '#ffffffff')],
          ),
        ],
  );

  blocTest<ColorGalleryCubit, ColorGalleryState>(
    '[getColors] loading -> empty colors, loading == false',
    build: () {
      when(colorRepository.getColors()).thenAnswer((_) async => []);

      return colorGalleryCubit;
    },
    act: (cubit) {
      cubit.getColors();
    },
    expect:
        () => [
          const ColorGalleryState(loading: true, colors: []),
          const ColorGalleryState(loading: false, colors: []),
        ],
  );

  blocTest<ColorGalleryCubit, ColorGalleryState>(
    '[getColors] loading -> error, loading == false',
    build: () {
      when(
        colorRepository.getColors(),
      ).thenThrow(Exception('Cannot access Database'));

      return colorGalleryCubit;
    },
    act: (cubit) {
      cubit.getColors();
    },
    expect:
        () => [
          const ColorGalleryState(loading: true, colors: []),
          const ColorGalleryState(
            loading: false,
            colors: [],
            error: 'Exception: Cannot access Database',
          ),
        ],
  );
}
