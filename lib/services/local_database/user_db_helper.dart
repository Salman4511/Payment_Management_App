import 'package:payment_management_app/models/user/user_model.dart';
import 'package:sqflite/sqflite.dart';


class UserDatabaseHelper {
 static const _databaseVersion = 1;

  static const table = 'user';

  static const columnId = '_id';
  static const columnName = 'name';
  static const columnMailId = 'mailId';
  static const columnBalance = 'balance';
  static const columnProfilePicture = 'profile_picture';

  static Database? _userdatabase;

  Future<Database> get userdatabase async {
    if (_userdatabase != null) return _userdatabase!;
    _userdatabase = await _initDatabase();
    return _userdatabase!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      'user.db',
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnName TEXT NOT NULL,
        $columnMailId TEXT NOT NULL,
        $columnBalance REAL NOT NULL,
        $columnProfilePicture TEXT NOT NULL
      )
      ''');
  }

  Future<int> insertUser(UserModel user) async {
    final db = await userdatabase;
    return await db.insert(
      table,
      {
        columnName: user.name,
        columnMailId: user.mailId,
        columnBalance: user.balance,
        columnProfilePicture: user.profilePicture,
      },
    );
  }

  Future<List<UserModel>> getUser() async {
    final db = await userdatabase;
    final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(
      maps.length,
      (index) => UserModel(
        id: maps[index][columnId],
        name: maps[index][columnName],
        mailId: maps[index][columnMailId],
        balance: maps[index][columnBalance],
        profilePicture: maps[index][columnProfilePicture],
      ),
    );
  }

}



