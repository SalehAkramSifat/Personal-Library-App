import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/book_provider.dart';
import '../widgets/book_tile.dart';
import 'add_book_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String filter = 'All';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookProvider>(context);
    final books = provider.book.where((book) {
      if (filter == 'Read') return book.isRead == false;
      if (filter == 'Unread') return book.isRead == true;
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Library'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                filter = value;
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'All', child: Text('All')),
              const PopupMenuItem(value: 'Read', child: Text('Read')),
              const PopupMenuItem(value: 'Unread', child: Text('Unread')),
            ],
          ),
        ],
      ),
      body: books.isEmpty
          ? const Center(child: Text('No books added yet.'))
          : ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) => BookTile(book: books[index]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AddBookScreen()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
