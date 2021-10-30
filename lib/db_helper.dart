import 'package:courses/Models/Course.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper.internal();
  factory DBHelper() => _instance;
  DBHelper.internal();
  static Database _db;
  createDatabse() async {
    if (_db != null) {
      return _db;
    }
    //define path to database
    String path = join(await getDatabasesPath(), 'school.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        //create tables
        db.execute(
            "create table courses(id integer primary key autoincrement,name varchar(50) ,decribtion varchar(250) ,hours integer)");
      },
    );
    return _db;
  }

  Future<int> createCourse(Course course) async {
    Database db = await createDatabse();
    return db.insert('courses', course.toMap());
  }

  Future<List> allCorurses() async {
    Database db = await createDatabse();
    return db.query("courses");
  }

  Future<int> delete(int id) async {
    Database db = await createDatabse();
    return db.delete('courses', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Course course) async {
    Database db = await createDatabse();
    return db.update('courses', course.toMap(),
        where: 'id = ?', whereArgs: [course.id]);
  }
}
