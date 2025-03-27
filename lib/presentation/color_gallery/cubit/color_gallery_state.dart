// ignore_for_file: avoid_unused_parameters
part of 'color_gallery_cubit.dart';

/// State for Color Randomizer Cubit
/// contains [backgroundColor, textColor, showTipText] parameters
@freezed
class ColorGalleryState with _$ColorGalleryState {
  /// Constructor
  const factory ColorGalleryState({
    required bool loading,
    required List<ColorModel> colors,
    String? error,
  }) = _ColorGalleryState;
}
