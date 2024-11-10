// book_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../data/book_model.dart';

class BookService {
  final String _baseUrl = 'https://gutendex.com/books/';

  Future<List<Book>> fetchBooks() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['results'];
      return data.map((book) => Book.fromJson(book)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }

  Future<List<Book>> searchBooks(String query) async {
    final response = await http.get(Uri.parse('$_baseUrl?q=$query'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['results'];
      return data.map((book) => Book.fromJson(book)).toList();
    } else {
      throw Exception('Failed to search books');
    }
  }
}
