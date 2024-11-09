import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final bool isRead;

  const NotificationCard({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.isRead,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        isRead ? Icons.check_circle : Icons.error,
        color: isRead ? Colors.green : Colors.red,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
        ),
      ),
      subtitle: Text(subtitle),
      trailing: Text(
        time,
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
