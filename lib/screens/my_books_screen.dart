import 'package:flutter/material.dart';
import '../widgets/book_card.dart';

class MyBooksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Books'),
      ),
      body: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Active Borrows'),
              Tab(text: 'Returned'),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => BookCard(),
            ),
          ),
        ],
      ),
    );
  }
}
