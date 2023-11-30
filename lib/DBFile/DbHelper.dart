import 'dart:io' as io;

import 'package:masterofmaincraft/DBFile/notes.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBhelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'notes.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int verion) async {
    await db.execute(
        "CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT ,text TEXT,image TEXT)");
  }

  Future<NotesModel> insert(NotesModel notesModel) async {
    var dbclient = await db;
    await dbclient!.insert('notes', notesModel.toMap());
    return notesModel;
  }

  Future<List<NotesModel>> getNotesList() async {
    var dbclient = await db;
    final List<Map<String, Object?>> queryResult =
        await dbclient!.query('notes');
    return queryResult.map((e) => NotesModel.fromMap(e)).toList();
  }

  Future<int> delet(String text) async {
    var dbClient = await db;
    return await dbClient!.delete('notes', where: 'text =?', whereArgs: [text]);
  }

  Future<Database?> Open(int id) async {
    _db = await openDatabase(join(await getDatabasesPath(), 'notes.db'));
    return _db;
  }
}
