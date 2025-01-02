import 'package:flutter/material.dart';
import 'package:gym_management_app/adminScreen/progress_tracking/ProgressReportScreen.dart';
import 'progress_list_screen.dart';

class ProgressDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Dashboard'),
        backgroundColor: Colors.deepPurple, // You can change this color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProgressListScreen()),
                );
              },
              icon: Icon(Icons.bar_chart), // Add an icon to the button
              label: Text('View Progress Records'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0), // Rounded corners
                ),
                backgroundColor: Colors.deepPurple, // Button background color
                // onPrimary: Colors.white, // Text color
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProgressReportScreen()),
                );

              },
              icon: Icon(Icons.report),
              label: Text('Generate Reports'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0), // Rounded corners
                ),
                backgroundColor: Colors.orange, // Different color for this button
                // onPrimary: Colors.white,
              )
            ),
          ],
        ),
      ),
    );
  }
}
