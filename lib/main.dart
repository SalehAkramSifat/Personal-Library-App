import 'package:flutter/material.dart';
import 'package:personal_library_app/provider/book_provider.dart';
import 'package:personal_library_app/screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => BookProvider(),
    child: MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Personal Library',
    theme: ThemeData(
    primarySwatch: Colors.indigo,
    useMaterial3: true,
    ),
    home: const HomeScreen(),
    ));
    }
}