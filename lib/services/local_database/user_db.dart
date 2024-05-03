// class DatabaseHelper{
//   static const _databaseVersion = 1;

//   static const table = 'students';

//   static const columnId = '_id';
//   static const columnName = 'name';
//   static const columnSchoolname = 'schoolname';
//   static const columnFathername = 'fathername';
//   static const columnAge = 'Age';
//   static const columnProfilePicture = 'profile_picture';

//   static Database? _database;

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     return await openDatabase(
//       'student.db',
//       version: _databaseVersion,
//       onCreate: _onCreate,
//     );
//   }

//   Future<void> _onCreate(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE $table (
//         $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
//         $columnName TEXT NOT NULL,
//         $columnSchoolname TEXT NOT NULL,
//         $columnFathername TEXT NOT NULL,
//         $columnAge INTEGER NOT NULL,
//         $columnProfilePicture TEXT NOT NULL
//       )
//       ''');
//   }

//   Future<List<Student>> getStudents() async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query(table);
//     return List.generate(
//       maps.length,
//       (index) => Student(
//         id: maps[index][columnId],
//         name: maps[index][columnName],
//         schoolname: maps[index][columnSchoolname],
//         fathername: maps[index][columnFathername],
//         age: maps[index][columnAge],
//         profilePicture: maps[index][columnProfilePicture],
//       ),
//     );
//   }
// }