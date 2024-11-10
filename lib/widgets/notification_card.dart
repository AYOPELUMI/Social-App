import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final DateTime time;
  final bool isRead;

  const NotificationCard({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.isRead,
  });

  String getTimeDifferenceString(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return '1 day ago';
    } else {
      return '${difference.inDays} days ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final formattedTime = getTimeDifferenceString(time);

    return Padding(
      padding: const EdgeInsets.all(8.0), // Padding around the card
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            isRead
                ? Icons.check_circle
                : Icons.clear, // Cross icon for declined
            color: isRead ? theme.colorScheme.primary : theme.colorScheme.error,
            size: 32,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontWeight:
                              isRead ? FontWeight.normal : FontWeight.bold,
                          color: theme.textTheme.bodyLarge?.color,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          formattedTime,
                          style: TextStyle(color: Colors.grey),
                        ),
                        if (!isRead)
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Icon(
                              Icons.circle,
                              size: 8,
                              color: theme.colorScheme.error,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(color: theme.textTheme.bodySmall?.color),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
