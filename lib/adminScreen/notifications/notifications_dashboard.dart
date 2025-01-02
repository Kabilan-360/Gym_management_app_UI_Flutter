import 'package:flutter/material.dart';
import 'member_notifications_screen.dart';
import 'session_alerts_screen.dart';
import 'admin_alerts_screen.dart';

class NotificationsDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Notifications & Alerts'),
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
                'Manage Alerts and Notifications',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: 20),
              _buildNotificationButton(
                context,
                'Member Notifications',
                Icons.notifications_active,
                MemberNotificationsScreen(),
              ),
              SizedBox(height: 15),
              _buildNotificationButton(
                context,
                'Session Alerts',
                Icons.event_note,
                SessionAlertsScreen(),
              ),
              SizedBox(height: 15),
              _buildNotificationButton(
                context,
                'Admin Alerts',
                Icons.admin_panel_settings,
                AdminAlertsScreen(),
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
      Widget screen,
      ) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
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
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
