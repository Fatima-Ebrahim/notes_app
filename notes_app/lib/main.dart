// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/notes/providers/note_provider.dart';
import 'features/notes/screens/notes_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NoteProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const NotesScreen(),
    );
  }
}