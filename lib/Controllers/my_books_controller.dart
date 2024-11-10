import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyBooksController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var selectedTabIndex = 0.obs;

  // Search query variable
  var searchQuery = ''.obs;

  // Sample list of books
  List<Map<String, dynamic>> allBooks = [
    {
      'title': 'Games of Thrones',
      'author': 'George R.R Martin',
      'rating': 4.5,
      'isborrowing': true,
      'isReturned': false
    },
    {
      'title': 'The Hobbit',
      'author': 'J.R.R. Tolkien',
      'rating': 4.7,
      'isborrowing': false,
      'isReturned': true
    },
    {
      'title': 'The Catcher in the Rye',
      'author': 'J.D. Salinger',
      'rating': 4.2,
      'isborrowing': true,
      'isReturned': false
    },
    {
      'title': '1984',
      'author': 'George Orwell',
      'rating': 4.4,
      'isborrowing': false,
      'isReturned': true
    },
    // Add more books as needed
  ];

  // Getter for filtered books based on the current tab and search query
  List<Map<String, dynamic>> get filteredBooks {
    List<Map<String, dynamic>> filtered = allBooks;

    // Apply search filter
    if (searchQuery.value.isNotEmpty) {
      filtered = filtered
          .where((book) =>
              book['title']
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase()) ||
              book['author']
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase()))
          .toList();
    }

    // Apply tab-based filtering
    switch (selectedTabIndex.value) {
      case 0: // "All" Tab
        break; // No additional filter for "All"
      case 1: // "Active Borrowing" Tab
        filtered = filtered
            .where((book) =>
                book['isborrowing'] == true && book['isReturned'] == false)
            .toList();
        break;
      case 2: // "Returned" Tab
        filtered =
            filtered.where((book) => book['isReturned'] == true).toList();
        break;
    }

    return filtered;
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      selectedTabIndex.value = tabController.index;
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  // Method to update search query
  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }
}
