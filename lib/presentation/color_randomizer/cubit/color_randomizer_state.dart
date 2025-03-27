// ignore_for_file: avoid_unused_parameters
part of 'color_randomizer_cubit.dart';

/// State for Color Randomizer Cubit
/// contains [backgroundColor, textColor, showTipText] parameters
@freezed
class ColorRandomizerState with _$ColorRandomizerState {
  /// Constructor
  const factory ColorRandomizerState({
    required Color backgroundColor,
    required Color textColor,
    required bool firstColorGenerated,
    String? error,
    bool? showDatabaseSaveSuccess,
  }) = _ColorRandomizerState;
}
