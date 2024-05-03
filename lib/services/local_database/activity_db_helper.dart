import 'package:payment_management_app/models/activity_model/activity_model.dart';
import 'package:sqflite/sqflite.dart';

class ActivityDatabaseHelper{
  static const _databaseVersion = 1;

  static const table = 'activity';

  static const columnId = '_id';
  static const columnProduct = 'name';
  static const columnCompany = 'secondName';
  static const columnReturnMsg = 'profile_picture';
  static const columnPrice = 'price';
  static const columnAddress = 'address';

  static Database? _activitydatabase;

  Future<Database> get activitydatabase async {
    if (_activitydatabase != null) return _activitydatabase!;
    _activitydatabase = await _initDatabase();
    return _activitydatabase!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      'activity.db',
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnProduct TEXT NOT NULL,
        $columnCompany TEXT NOT NULL,
        $columnReturnMsg TEXT NOT NULL,
        $columnAddress TEXT NOT NULL,
        $columnPrice REAL NOT NULL

      )
      ''');
  }

  Future<int> insertActivity(ActivityModel activity) async {
    final db = await activitydatabase;
    return await db.insert(
      table,
      {
        columnProduct: activity.product,
        columnCompany: activity.company,
        columnReturnMsg: activity.returnMessage,
        columnAddress:activity.address,
        columnPrice: activity.price
      },
    );
  }

  Future<List<ActivityModel>> getActivity() async {
    final db = await activitydatabase;
    final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(
      maps.length,
      (index) => ActivityModel(
        id: maps[index][columnId],
        product: maps[index][columnProduct],
        company: maps[index][columnCompany],
        returnMessage: maps[index][columnReturnMsg],
        address:maps[index][columnAddress],
        price: maps[index][columnPrice]
      ),
    );
  }
}