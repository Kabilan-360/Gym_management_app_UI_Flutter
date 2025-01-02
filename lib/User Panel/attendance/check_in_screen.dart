import 'package:flutter/material.dart';

class CheckInScreen extends StatefulWidget {
  @override
  _CheckInScreenState createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  String checkInMessage = 'Not Checked In';
  bool isCheckedIn = false;

  void performDummyCheckIn() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Check-In'),
        content: Text('Are you sure you want to check in?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              setState(() {
                isCheckedIn = true;
                checkInMessage = 'Check-in Successful at ${DateTime.now()}';
              });
            },
            child: Text('Confirm'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Check In')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isCheckedIn ? Icons.check_circle : Icons.cancel,
              color: isCheckedIn ? Colors.green : Colors.red,
              size: 100,
            ),
            SizedBox(height: 16),
            Text(
              checkInMessage,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isCheckedIn ? Colors.green : Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: performDummyCheckIn,
              child: Text('Simulate Check-In'),
              style: ElevatedButton.styleFrom(
                backgroundColor: isCheckedIn ? Colors.grey : Colors.blue,
                // onPrimary: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
