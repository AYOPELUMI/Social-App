import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/my_books_controller.dart';
import '../widgets/book_card.dart';

class MyBooksScreen extends StatefulWidget {
  const MyBooksScreen({super.key});

  @override
  State<MyBooksScreen> createState() => _MyBooksScreenState();
}

class _MyBooksScreenState extends State<MyBooksScreen> {
  String selectedFilter = 'All'; // Default filter
  bool isFilterVisible = false; // Toggle visibility of filter options

  // Define filter options
  final List<String> filterOptions = [
    'All',
    'Option 1',
    'Option 2',
    'Option 3',
  ];

  @override
  Widget build(BuildContext context) {
    final MyBooksController controller = Get.put(MyBooksController());
    final theme = Theme.of(context);
    final activeColor = Colors.white;
    final inactiveColor = theme.scaffoldBackgroundColor;
    final shadowColor = Colors.grey.shade300;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('My Books'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(3, (index) {
                final bool isActive =
                    controller.selectedTabIndex.value == index;
                final String label =
                    ['All', 'Active borrows', 'Returned'][index];

                return GestureDetector(
                  onTap: () {
                    controller.tabController.animateTo(index);
                    controller.selectedTabIndex.value = index;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    decoration: BoxDecoration(
                      color: isActive ? activeColor : inactiveColor,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: isActive
                          ? [
                              BoxShadow(
                                color: shadowColor,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ]
                          : [],
                    ),
                    child: Text(
                      label,
                      style: TextStyle(
                        color:
                            isActive ? theme.colorScheme.primary : Colors.grey,
                        fontWeight:
                            isActive ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }),
            );
          }),
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 24, horizontal: 25),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .primary, // Border color from theme
                    width: 1.5, // Adjust width of the border
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (query) {
                          controller.updateSearchQuery(query);
                        },
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.filter_list,
                          color: Theme.of(context)
                              .colorScheme
                              .primary), // Theme color for icon
                      onPressed: () {
                        setState(() {
                          isFilterVisible = !isFilterVisible;
                        });
                      },
                    ),
                  ],
                ),
              ),
              // Display the filter options
              if (isFilterVisible)
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade800,
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    children: filterOptions.map((filter) {
                      return ListTile(
                          title: Text(filter),
                          onTap: () {
                            setState(() {
                              selectedFilter = filter;
                              isFilterVisible =
                                  false; // Close the filter options
                            });
                          });
                    }).toList(),
                  ),
                ),
            ],
          ),
          // Book list
          Expanded(
            child: Obx(() {
              final books = controller.filteredBooks;
              return ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return BookCard(
                    title: book['title'],
                    author: book['author'],
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
