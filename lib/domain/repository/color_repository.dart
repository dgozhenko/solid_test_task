import 'package:solid_test_task/domain/model/color.dart';

/// Abstract class for color repository
abstract class ColorRepository {
  /// inserts color
  Future<void> insertColor(Map<String, dynamic> colorMap);
  /// get list of colors
  Future<List<ColorModel>> getColors();
}
