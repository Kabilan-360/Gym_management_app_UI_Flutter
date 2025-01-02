import 'package:flutter/material.dart';

class SessionAlertsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Session Alerts'),
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
                'Manage Session Alerts',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: 20),
              _buildAlertButton(
                context,
                'Notify Session Cancellation',
                Icons.cancel,
                "Cancel Session",
                "Notify members about session cancellation.",
                "Session cancellation alert sent",
              ),
              SizedBox(height: 15),
              _buildAlertButton(
                context,
                'Notify Session Change',
                Icons.refresh,
                "Session Changed",
                "Notify members about session changes.",
                "Session change alert sent",
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
      String dialogTitle,
      String dialogContent,
      String successMessage,
      ) {
    return ElevatedButton.icon(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(dialogTitle),
            content: Text(dialogContent),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(successMessage)),
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
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
