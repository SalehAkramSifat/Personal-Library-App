import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/book_model.dart';
import '../provider/book_provider.dart';

class BookTile extends StatelessWidget {
  final Book book;

  const BookTile({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text(book.title),
        subtitle: Text('${book.author} • ${book.rating}/5'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                Provider.of<BookProvider>(context, listen: false).deleteBook(book.id!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
