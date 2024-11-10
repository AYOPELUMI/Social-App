import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String title;
  final String author;
  final double rating;

  const BookCard({
    required this.title,
    required this.author,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 25),
      child: Row(
        children: [
          Container(
            width: 103,
            height: 153,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFF4DADA),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Expanded(
            // This ensures that the column takes up remaining space
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity, // Ensures the text takes full width
                  child: Text(
                    title,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  author,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    Text("$rating",
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
                SizedBox(height: 10),
                Text('3 days left',
                    style: Theme.of(context).textTheme.titleLarge)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
