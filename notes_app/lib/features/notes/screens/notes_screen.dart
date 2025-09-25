// lib/features/notes/screens/notes_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/note_provider.dart';
import '../widgets/add_note_dialog.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch notes when the screen is first loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NoteProvider>().fetchNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Notes Client'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Consumer<NoteProvider>(
        builder: (context, provider, child) {
          switch (provider.state) {
            case NotifierState.loading:
              return const Center(child: CircularProgressIndicator());
            case NotifierState.error:
              return Center(child: Text(provider.errorMessage));
            case NotifierState.loaded:
              return provider.notes.isEmpty
                  ? const Center(child: Text('No notes found. Add one!'))
                  : ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: provider.notes.length,
                      itemBuilder: (context, index) {
                        final note = provider.notes[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 4.0),
                          child: ListTile(
                            title: Text(note.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(note.content),
                          ),
                        );
                      },
                    );
            default:
              return const Center(child: Text('Press the button to fetch notes.'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddNoteDialog(context),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      )
    );
  }
}