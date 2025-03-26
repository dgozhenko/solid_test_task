
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solid_test_task/domain/model/color_model.dart';
import 'package:solid_test_task/domain/repository/color_repository.dart';

part 'color_gallery_cubit.freezed.dart';
part 'color_gallery_state.dart';
/// color gallery cubit implementation
class ColorGalleryCubit extends Cubit<ColorGalleryState> {
  /// color repository for accessing database
  final ColorRepository colorRepository;
  /// constructor
  ColorGalleryCubit({required this.colorRepository})
    : super(const ColorGalleryState(colors: [], loading: false));
  /// method for getting colors from database
  Future<void> getColors() async {
    try {
      emit(state.copyWith(loading: true));
      final colors = await colorRepository.getColors();
      emit(state.copyWith(colors: colors, loading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
