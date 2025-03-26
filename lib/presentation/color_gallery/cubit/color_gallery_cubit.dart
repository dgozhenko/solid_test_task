import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solid_test_task/domain/model/color.dart';
import 'package:solid_test_task/domain/repository/color_repository.dart';

part 'color_gallery_cubit.freezed.dart';
part 'color_gallery_state.dart';

class ColorGalleryCubit extends Cubit<ColorGalleryState> {
  final ColorRepository colorRepository;

  ColorGalleryCubit({required this.colorRepository})
    : super(const ColorGalleryState(colors: [], loading: false));

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
