import 'package:solid_test_task/core/helper/database_helper.dart';
import 'package:solid_test_task/domain/model/color.dart';
import 'package:solid_test_task/domain/repository/color_repository.dart';
import 'package:sqflite/sqflite.dart';

/// Implementation of Color Repository
class ColorRepositoryImpl extends ColorRepository {
  /// database helper singleton required to use database
  final DatabaseHelper databaseHelper;

  /// constructor
  ColorRepositoryImpl({required this.databaseHelper});

  @override
  Future<void> insertColor(Map<String, dynamic> colorMap) async {
    final database = await databaseHelper.database;
    await database.insert(
      'colors',
      colorMap,
      conflictAlgorithm: ConflictAlgorithm.abort,
    );
  }

  @override
  Future<List<ColorModel>> getColors() async {
    final database = await databaseHelper.database;
    final colorsMap = await database.query('colors');

    return [
      for (final {'hexString': hexString as String} in colorsMap)
        ColorModel(hexString: hexString),
    ];
  }
}
