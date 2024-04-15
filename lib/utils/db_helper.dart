import 'dart:io';
import 'package:advance_exam/screen/like/model/db_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static DbHelper dbHelper = DbHelper._();

  DbHelper._();

  Database? database;
  final String DB_DATA = "data.db";

  Future<Database> checkDb() async {
    if (database != null) {
      return database!;
    } else {
      return await initDb();
    }
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, DB_DATA);
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String chatGpt =
            "CREATE TABLE searchTable(id INTEGER PRIMARY KEY AUTOINCREMENT,result TEXT)";
        db.execute(chatGpt);
      },
    );
  }

  Future<void> insertData(DbModel dbModel) async {
    database = await checkDb();
    database!.insert("searchTable", {
      "id": dbModel.id,
      "result": dbModel.result,
    });
  }

  Future<List<DbModel>> readData() async {
    database = await checkDb();
    String query = "SELECT * FROM searchTable";
    List<Map> data = await database!.rawQuery(query, null);
    List<DbModel> modelList = data.map((e) => DbModel.mapToModel(e)).toList();
    return modelList;
  }

  Future<void> deleteData({required String id}) async {
    database = await checkDb();
    database!.delete(
      "searchTable",
      where: "id=?",
      whereArgs: [id],
    );
  }
}
