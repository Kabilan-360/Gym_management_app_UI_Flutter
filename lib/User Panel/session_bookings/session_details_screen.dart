import 'package:flutter/material.dart';

class SessionDetailsScreen extends StatelessWidget {
  final Map<String, String> session;

  SessionDetailsScreen({required this.session});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(session['title']!)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date: ${session['date']}', style: TextStyle(fontSize: 18)),
            Text('Time: ${session['time']}', style: TextStyle(fontSize: 18)),
            Text('Trainer: ${session['trainer']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Simulate booking confirmation
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Session booked successfully!')),
                );
                Navigator.pop(context);
              },
              child: Text('Confirm Booking'),
            ),
          ],
        ),
      ),
    );
  }
}
