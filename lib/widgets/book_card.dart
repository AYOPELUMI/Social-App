import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            color: Colors.grey[300],
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Game of Thrones', style: Theme.of(context).textTheme.bodyMedium),
          ),
          Text('George R.R. Martin', style: Theme.of(context).textTheme.bodySmall),
          Text('3 days left', style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}
