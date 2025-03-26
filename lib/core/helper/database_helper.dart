import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

/// SQFLite database helper
class DatabaseHelper {
  static Database? _database;
  /// singleton instance of database
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  /// getter for database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();

    return _database!;
  }

  DatabaseHelper._privateConstructor();

  Future<Database> _initDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'colors_database.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (database, _) async {
        await database.execute(
          'CREATE TABLE colors(hexString TEXT PRIMARY KEY)',
        );
      },
    );
  }
}
