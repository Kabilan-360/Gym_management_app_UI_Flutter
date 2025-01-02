import 'package:flutter/material.dart';

class AdminAlertsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Admin Alerts'),
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
                'Manage Admin Alerts',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: 20),
              _buildAlertButton(
                context,
                'Low Inventory Alert',
                Icons.inventory,
                'Notify admins about low equipment inventory.',
              ),
              SizedBox(height: 15),
              _buildAlertButton(
                context,
                'Payment Delay Alert',
                Icons.payment,
                'Notify admins about delayed payments.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAlertButton(
      BuildContext context,
      String title,
      IconData icon,
      String message,
      ) {
    return ElevatedButton.icon(
      onPressed: () {
        // Show dialog for alert confirmation
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
                  // Send alert logic
                  Navigator.pop(context); // Close the dialog
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("$title sent")),
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
