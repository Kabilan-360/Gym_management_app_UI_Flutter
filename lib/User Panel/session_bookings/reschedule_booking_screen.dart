import 'package:flutter/material.dart';

class RescheduleBookingScreen extends StatelessWidget {
  final Map<String, String> session;

  RescheduleBookingScreen({required this.session});

  @override
  Widget build(BuildContext context) {
    final TextEditingController dateController = TextEditingController();
    final TextEditingController timeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Reschedule Booking'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.tealAccent, Colors.teal],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reschedule your session:',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Current Session:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text('Date: ${session['date']}'),
                Text('Time: ${session['time']}'),
                SizedBox(height: 20),
                Divider(),
                SizedBox(height: 10),
                TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                    labelText: 'New Date',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: timeController,
                  decoration: InputDecoration(
                    labelText: 'New Time',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (dateController.text.isEmpty || timeController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please fill in both fields!')),
                      );
                    } else {
                      // Simulate rescheduling
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Session rescheduled to ${dateController.text} at ${timeController.text}',
                          ),
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Confirm Reschedule'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
