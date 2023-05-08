import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTable(sql.Database database) async {
    await database.execute(""" CREATE TABLE user(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT,
    email TEXT,
    password TEXT,
    is_Logged INTEGER
    ) """);
  }

  static Future<sql.Database> openDb() async {
    return sql.openDatabase("datauser", version: 1,
      onCreate: (sql.Database database, int version) async {
        return createTable(database);
      },
    );
  }

  static Future<List<Map>> userFound(String name, String email) async {
    final db = await SQLHelper.openDb();
    final data = await db.rawQuery(
        "SELECT * FROM user WHERE name = '$name' AND email = '$email' ");

    if (data.isNotEmpty) {
      return data;
    }
    return data;
  }

  static Future<int> addNewUser(String name, String email,
      String password) async {
    final db = await SQLHelper.openDb();
    final data = {"name": name, "email": email, "password": password};
    final id = db.insert("user", data);
    return id;
  }

  static Future<List<Map>> checkLogin(String email, String password) async {
    final db = await SQLHelper.openDb();
    final data = await db.rawQuery(
        "SELECT * FROM user WHERE email = '$email' AND password = '$password' ");

    if (data.isNotEmpty) {
      return data;
    }
    return data;
  }

  static Future<List<Map>> getAll() async {
    final db = await SQLHelper.openDb();
    final data = db.rawQuery("SELECT * FROM user");
    return data;

    }

  static Future<void> deleteUser(int id) async {
    final db = await SQLHelper.openDb();
    db.delete("user", where: "id = ?", whereArgs: [id]);
  }

  static Future<int> updateUser(int id, String newName, String newEmail, String newPassword) async{
    final db = await SQLHelper.openDb();
    final newData = {
      "name" : newName,
      "email" : newEmail,
      "password" : newPassword
    };

    final result = await db.update("user", newData,where: "id = ?", whereArgs: [id]);
    return result;

  }

}

