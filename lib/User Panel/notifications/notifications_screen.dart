import 'package:flutter/material.dart';
import 'notification_item.dart';

class NotificationsScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'title': 'Upcoming Session',
      'message': 'Yoga Session tomorrow at 10:00 AM with Trainer Alice.',
      'date': '04 Jan 2025',
    },
    {
      'title': 'Membership Due',
      'message': 'Your membership fee is due. Please make a payment by 07 Jan 2025.',
      'date': '03 Jan 2025',
    },
    {
      'title': 'Special Offer',
      'message': 'Get 20% off on yearly memberships! Valid until 15 Jan 2025.',
      'date': '02 Jan 2025',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.teal, // Match the theme color
        centerTitle: true, // Centers the title for better presentation
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Adds padding for better UI spacing
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return NotificationItem(notification: notification);
          },
        ),
      ),
    );
  }
}
