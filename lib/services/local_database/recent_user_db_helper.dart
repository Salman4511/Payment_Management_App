import 'package:payment_management_app/models/recent_user_payment_model/recent_user_payment_model.dart';
import 'package:sqflite/sqflite.dart';

class RecentUserDatabaseHelper {
  static const _databaseVersion = 1;

  static const table = 'recent_user';

  static const columnId = '_id';
  static const columnName = 'name';
  static const columnSecondName = 'secondName';
  static const columnProfilePicture = 'profile_picture';

  static Database? _recentuserdatabase;

  Future<Database> get recentuserdatabase async {
    if (_recentuserdatabase != null) return _recentuserdatabase!;
    _recentuserdatabase = await _initDatabase();
    return _recentuserdatabase!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      'recent_user.db',
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnName TEXT NOT NULL,
        $columnSecondName TEXT NOT NULL,
        $columnProfilePicture TEXT NOT NULL
      )
      ''');
  }

  Future<int> insertUser(RecentUserPaymentModel recentUser) async {
    final db = await recentuserdatabase;
    return await db.insert(
      table,
      {
        columnName: recentUser.name,
        columnSecondName: recentUser.secondName,
        columnProfilePicture: recentUser.profilePicture,
      },
    );
  }

  Future<List<RecentUserPaymentModel>> getRecentUser() async {
    final db = await recentuserdatabase;
    final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(
      maps.length,
      (index) => RecentUserPaymentModel(
        id: maps[index][columnId],
        name: maps[index][columnName],
        secondName: maps[index][columnSecondName],
        profilePicture: maps[index][columnProfilePicture],
      ),
    );
  }
}
