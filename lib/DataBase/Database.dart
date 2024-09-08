// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// import '../Modal/Modal.dart';
//
// class DbHelper {
//   static DbHelper dbHelper = DbHelper._();
//
//   DbHelper._();
//
//   Database? _db;
//   String dbName = 'student.db', tableName = 'student';
//
//   Future get dataBase async => _db ?? initDb();
//
//   //CREATE
//   Future<Database> initDb() async {
//     final path = await getDatabasesPath();
//     final dbPath = join(path, '$dbName');
//
//     return await openDatabase(
//       dbPath,
//       version: 1,
//       onCreate: (db, version) async {
//         String sql = '''
//       CREATE TABLE $tableName(
//       id INTEGER PRIMARY KEY AUTOINCREMENT,
//       age INTEGER NOT NULL,
//       name TEXT NOT NULL
//       )
//        ''';
//         await db.execute(sql);
//       },
//     );
//   }
//
//   //READ
//   Future<List<Map<String, Object?>>> readData() async {
//     Database db = await dataBase;
//     String sql = '''SELECT * FROM $tableName''';
//     return await db.rawQuery(sql);
//   }
//
//   //INSERT
//   Future<void> insertData(StudentModal emp) async {
//     Database db = await dataBase;
//     String sql = '''INSERT INTO $tableName(id,age,name)
//     VALUES(?,?,?)''';
//     List args = [emp.id,emp.age,emp.name];
//       db.rawQuery(sql,args);
//
//
//
//   }
//
//   //UPDATE
//
//   //DELETE
//   Future<void> deleteData(int id) async {
//     Database db = await dataBase;
//     String sql = '''DELETE FROM $tableName WHERE id = ?''';
//     List args = [id];
//     await db.rawDelete(sql,args);
//   }
// }
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_app/Modal/Modal.dart';

class DbHelper {
  static DbHelper dbHelper = DbHelper._();
  DbHelper._();
  Database? _db;

  Future get database async => _db ?? await initDatabase();

  Future initDatabase() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, 'finance.db');

    _db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        String sql = '''CREATE TABLE finance(
        id INTEGER NOT NULL,
        age INTEGER NOT NULL,
        name TEXT NOT NULL
       );
        ''';
        await db.execute(sql);
      },
    );
    return _db;
  }

 Future<int>insertData(StudentModal student)  async {
    Database? db = await database;
    String sql = '''INSERT INTO finance (id,age,name)
    VALUES (?,?,?);
    ''';
    List args = [student.id,student.age,student.name];
    return await db!.rawInsert(sql, args);
  }

  Future<List<Map<String, Object?>>> readData() async {
    Database? db = await database;
    String sql = '''SELECT * FROM finance''';
    return await db!.rawQuery(sql);
  }
  Future<List<Map<String, Object?>>> readCategorywiseData(int isIncome)
  async {
    Database? db=await database;
    String sql ='''SELECT * FROM finance where isIncome=?''';
    List args=[isIncome];
    return await db!.rawQuery(sql,args);

  }
  Future<List<Map<String, Object?>>> readLiveData(String category)
  async {
    Database? db=await database;
    String sql="SELECT * FROM finance WHERE  category LIKE '%$category%'" ;
    return await db!.rawQuery(sql);
  }
  Future<void> updateData(StudentModal student ,int id)
  async {
    Database? db =await database;
    String sql=''' UPDATE finance SET id=?,age=?,name=?''';
    List args=[student.id,student.age,student.name];
    await db!.rawUpdate(sql,args);
  }

  Future deleteData(int id) async {
    Database? db = await database;
    String sql = '''DELETE FROM finance WHERE id = ?''';
    List args = [id];
    await db!.rawDelete(sql, args);
  }
}
