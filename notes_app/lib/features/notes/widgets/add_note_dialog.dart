// lib/features/notes/widgets/add_note_dialog.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/note_provider.dart';

void showAddNoteDialog(BuildContext context) {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Add New Note'),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) => value!.isEmpty ? 'Title cannot be empty' : null,
              ),
              TextFormField(
                controller: contentController,
                decoration: const InputDecoration(labelText: 'Content'),
                validator: (value) => value!.isEmpty ? 'Content cannot be empty' : null,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                // Use `context.read` inside a callback.
                context.read<NoteProvider>().addNote(
                      titleController.text,
                      contentController.text,
                    );
                Navigator.of(context).pop();
              }
            },
            child: const Text('Add'),
          ),
        ],
      );
    },
  );
}