import 'package:solid_test_task/domain/model/color_model.dart';

/// Abstract class for color repository
abstract class ColorRepository {
  /// inserts color
  Future<void> insertColor(Map<String, dynamic> colorMap);

  /// get list of colors
  Future<List<ColorModel>> getColors();

  /// delete color
  Future<void> deleteColor(String hexString);

  /// edit color
  Future<void> editColor({
    required String oldHexString,
    required Map<String, dynamic> colorMap,
  });
}
