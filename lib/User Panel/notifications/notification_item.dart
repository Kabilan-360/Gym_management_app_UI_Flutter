import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final Map<String, String> notification;

  NotificationItem({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      elevation: 5, // Adds a subtle shadow for a floating effect
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            notification['title']!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.teal, // Emphasizing the title
            ),
          ),
          subtitle: Text(
            notification['message']!,
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          trailing: Text(
            notification['date']!,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          onTap: () {
            // Show a snackbar when the notification is tapped
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Notification clicked: ${notification['title']}')),
            );
          },
        ),
      ),
    );
  }
}
