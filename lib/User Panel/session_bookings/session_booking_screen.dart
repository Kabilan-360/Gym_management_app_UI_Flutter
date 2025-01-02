import 'package:flutter/material.dart';
import 'session_details_screen.dart';

class SessionBookingScreen extends StatelessWidget {
  final List<Map<String, String>> sessions = [
    {
      'title': 'Yoga Session',
      'date': '05 Jan 2025',
      'time': '10:00 AM - 11:00 AM',
      'trainer': 'Alice',
    },
    {
      'title': 'Weightlifting Session',
      'date': '06 Jan 2025',
      'time': '2:00 PM - 3:00 PM',
      'trainer': 'Bob',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Session Bookings'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: sessions.length,
          itemBuilder: (context, index) {
            final session = sessions[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListTile(
                  title: Text(
                    session['title']!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Text('Date: ${session['date']}'),
                      Text('Time: ${session['time']}'),
                      Text('Trainer: ${session['trainer']}'),
                    ],
                  ),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SessionDetailsScreen(session: session),
                        ),
                      );
                    },
                    child: Text(
                      'Book Now',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
