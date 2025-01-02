import 'package:flutter/material.dart';

class MemberNotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Member Notifications'),
        backgroundColor: Colors.teal,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Manage Member Notifications',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: 20),
              _buildNotificationButton(
                context,
                'Send Offer Notification',
                Icons.local_offer,
                'Send notification about new offers to all members.',
              ),
              SizedBox(height: 15),
              _buildNotificationButton(
                context,
                'Send Event Reminder',
                Icons.event,
                'Send reminder for upcoming event to all members.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationButton(
      BuildContext context,
      String title,
      IconData icon,
      String message,
      ) {
    return ElevatedButton.icon(
      onPressed: () {
        // Show dialog for notification confirmation
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  // Simulate sending the notification
                  Navigator.pop(context); // Close the dialog
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("$title sent to all members")),
                  );
                },
                child: Text("Send"),
              ),
            ],
          ),
        );
      },
      icon: Icon(icon),
      label: Text(title),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal, // Button color
        padding: EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        textStyle: TextStyle(fontSize: 18),
      ),
    );
  }
}
