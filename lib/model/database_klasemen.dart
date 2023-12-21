import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'model_klasemen.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'example.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE klasemen("
              "id INTEGER PRIMARY KEY AUTOINCREMENT, "
              "Tim TEXT NOT NULL, "
              "P TEXT NOT NULL, "
              "W TEXT NOT NULL, "
              "D TEXT NOT NULL, "
              "L INTEGER, "
              "PTS INTEGER, "")",
        );
      },
      version: 1,
    );
  }

  Future<int> insertFee(List<ModelKlasemen> users) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var user in users) {
      result = await db.insert('klasemen', user.toMap());
    }
    return result;
  }

  Future<List<ModelKlasemen>> retrieveFee() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('klasemen');
    return queryResult.map((e) => ModelKlasemen.fromMap(e)).toList();
  }
}