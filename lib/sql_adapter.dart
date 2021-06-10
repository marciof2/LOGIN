import 'package:login/internal_storage.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLAdapter extends InternalStorageAdapter {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'user_database.db');

    return await openDatabase(path, onCreate: (db, version) {
      return db.execute('CREATE TABLE Users(name TEXT, surname TEXT)');
    }, version: 1);
  }

  Future<String> getFullName() {
    return Future.value('Nao encontrado');
  }

  @override
  void saveUser(String name, String surname) async {
    final Database db = await database;
    var user = {
      'name': name,
      'surname': surname,
    };
    await db.insert('Users', user);
    print('Usuario no Banco de Dados');
  }
}
