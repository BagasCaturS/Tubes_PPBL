import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'model_transfer.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'example.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE transfer("
              "id INTEGER PRIMARY KEY AUTOINCREMENT, "
              "player TEXT NOT NULL, "
              "from TEXT NOT NULL, "
              "to TEXT NOT NULL, "
              "transfer_fee TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }

  Future<int> insertFee(List<ModelTransfer> users) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var user in users) {
      result = await db.insert('transfer', user.toMap());
    }
    return result;
  }

  Future<List<ModelTransfer>> retrieveFee() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('transfer');
    return queryResult.map((e) => ModelTransfer.fromMap(e)).toList();
  }
}