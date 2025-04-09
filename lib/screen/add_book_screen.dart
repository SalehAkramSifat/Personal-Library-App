import 'package:flutter/material.dart';
import '../widgets/book_form.dart';

class AddBookScreen extends StatelessWidget {
  const AddBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Book')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: BookForm(),
      ),
    );
  }
}
