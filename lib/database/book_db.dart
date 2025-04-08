import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/book_model.dart';

class BookDB {
  static final BookDB instance = BookDB._init();
  static Database? _database;

  BookDB._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('books.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE books (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        author TEXT,
        description TEXT,
        rating INTEGER,
        isRead INTEGER)
    ''');
  }
  Future<int> insertBook(Book book) async {
    final db = await database;
    var result = await db.insert('books', book.toMap());
    return result;
  }
  Future<List<Book>> getBooks() async {
    final db = await database;
    var result = await db.query('books');
    return result.map((map)=> Book.fromMap(map)).toList();
  }
  Future<int> updateBook(Book books) async {
    final db = await database;
    var result = await db.update('books', books.toMap(), where: 'id=?', whereArgs: [books.id]);
    return result;
  }
  Future<int> deleteBook(int id) async {
    final db = await database;
    var result = await db.delete('books', where: 'id=?', whereArgs: [id]);
    return result;
  }

}

// 1, 2, 3, 4,