import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/widgets/book_card.dart';
import '../Controllers/books_list_controller.dart';

class BookListScreen extends StatelessWidget {
  final BookController controller = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            child: TextField(
              onChanged: (value) => controller.searchBooks(value),
              decoration: InputDecoration(
                hintText: 'Search books...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                itemCount: controller.filteredBooks.length,
                itemBuilder: (context, index) {
                  final book = controller.filteredBooks[index];
                  return BookCard(
                    title: book.title,
                    author: '${book.authors.map((a) => a.name).join(', ')}',
                    rating: 4.5,
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
