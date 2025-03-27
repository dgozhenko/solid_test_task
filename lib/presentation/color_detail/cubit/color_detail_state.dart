part of 'color_detail_cubit.dart';

/// State for Color Detail Cubit
/// contains [backgroundColor, error] parameters
@freezed
class ColorDetailState with _$ColorDetailState {
  /// Constructor
  const factory ColorDetailState({
    required Color? backgroundColor,
    required String? initialHexString,
    bool? navigateBack,
    String? error,
  }) = _ColorDetailState;
}
