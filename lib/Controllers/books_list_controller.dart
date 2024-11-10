import 'package:get/get.dart';

import '../data/book_model.dart';
import '../service/books_service.dart';

class BookController extends GetxController {
  var books = <Book>[].obs;
  var filteredBooks = <Book>[].obs;
  var isLoading = false.obs;

  final BookService _bookService = BookService();

  @override
  void onInit() {
    super.onInit();
    fetchBooks();
  }

  void fetchBooks() async {
    try {
      isLoading(true);
      var bookList = await _bookService.fetchBooks();
      books.assignAll(bookList);
      filteredBooks.assignAll(bookList);
      print(books);
      update();
    } catch (e) {
      print('Error fetching books: $e');
    } finally {
      isLoading(false);
    }
  }

  void searchBooks(String query) {
    if (query.isEmpty) {
      filteredBooks.assignAll(books);
    } else {
      filteredBooks.assignAll(
        books
            .where((book) =>
                book.title.toLowerCase().contains(query.toLowerCase()))
            .toList(),
      );
    }
  }

  void filterBooksBySubject(String subject) {
    filteredBooks.assignAll(
      books.where((book) => book.subjects.contains(subject)).toList(),
    );
  }
}
