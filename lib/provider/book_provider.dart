import 'package:flutter/material.dart';
import '../database/book_db.dart';
import '../model/book_model.dart';

class BookProvider with ChangeNotifier {
  List<Book> _books = [];
  List<Book> get book => _books;

  BookProvider(){
    _loadBooks();
  }

  Future<void> _loadBooks() async {
    _books = await BookDB.instance.getBooks();
    notifyListeners();
  }
  Future<void> addBook(Book book) async {
    await BookDB.instance.insertBook(book);
    await _loadBooks();
  }
  Future<void> deleteBook(int id) async {
    await BookDB.instance.deleteBook(id);
    await _loadBooks();
  }

}








// 1, 2, 3,