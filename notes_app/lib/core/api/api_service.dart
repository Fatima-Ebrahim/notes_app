import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/note.dart';

class ApiService {
  static const String _baseUrl = 'http://127.0.0.1:8000/api';

  Future<List<Note>> fetchNotes() async {
    final response = await http.get(Uri.parse('$_baseUrl/notes'));

    if (response.statusCode == 200) {
      final List<dynamic> notesJson = json.decode(response.body);
      return notesJson.map((json) => Note.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load notes');
    }
  }

  Future<Note> addNote(String title, String content) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/notes'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
        'content': content,
      }),
    );

    if (response.statusCode == 201) {
      
      return Note.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add note.');
    }
  }
}