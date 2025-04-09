import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/book_model.dart';
import '../provider/book_provider.dart';

class BookForm extends StatefulWidget {
  const BookForm({super.key});

  @override
  State<BookForm> createState() => _BookFormState();
}

class _BookFormState extends State<BookForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _ratingController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _descriptionController.dispose();
    _ratingController.dispose();
    super.dispose();
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      final newBook = Book(
        title: _titleController.text,
        author: _authorController.text,
        description: _descriptionController.text,
        rating: int.parse(_ratingController.text),
        isRead: false,
      );
      Provider.of<BookProvider>(context, listen: false).addBook(newBook);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              validator: (value) => value!.isEmpty ? 'Enter title' : null,
            ),
            TextFormField(
              controller: _authorController,
              decoration: const InputDecoration(labelText: 'Author'),
              validator: (value) => value!.isEmpty ? 'Enter author' : null,
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              validator: (value) => value!.isEmpty ? 'Enter description' : null,
            ),
            TextFormField(
              controller: _ratingController,
              decoration: const InputDecoration(labelText: 'Rating (0-5)'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) return 'Enter rating';
                final rating = int.tryParse(value);
                if (rating == null || rating < 0 || rating > 5) {
                  return 'Enter valid rating between 0-5';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveForm,
              child: const Text('Add Book'),
            ),
          ],
        ),
      ),
    );
  }
}
