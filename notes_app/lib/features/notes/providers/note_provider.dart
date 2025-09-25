
import 'package:flutter/foundation.dart';
import '../../../core/api/api_service.dart';
import '../../../core/models/note.dart';

enum NotifierState { initial, loading, loaded, error }

class NoteProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  NotifierState _state = NotifierState.initial;
  NotifierState get state => _state;

  List<Note> _notes = [];
  List<Note> get notes => _notes;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> fetchNotes() async {
    _setState(NotifierState.loading);
    try {
      _notes = await _apiService.fetchNotes();
      _setState(NotifierState.loaded);
    } catch (e) {
      _errorMessage = 'Failed to fetch notes: $e';
      _setState(NotifierState.error);
    }
  }

  Future<void> addNote(String title, String content) async {
    try {
      await _apiService.addNote(title, content);
      await fetchNotes();
    } catch (e) {
      print('Failed to add note: $e');
    }
  }

  void _setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }
}