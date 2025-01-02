import 'package:flutter/material.dart';

class AttendanceReportScreen extends StatelessWidget {
  void generateReport(BuildContext context, String type) {
    // Example placeholder functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$type Report generated successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Reports'),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Generate Attendance Reports',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => generateReport(context, 'Weekly'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Generate Weekly Report',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => generateReport(context, 'Monthly'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Generate Monthly Report',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => generateReport(context, 'Custom Range'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Generate Custom Range Report',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 40),
            Container(
              alignment: Alignment.center,
              child: Icon(
                Icons.bar_chart,
                color: Colors.indigoAccent,
                size: 100,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Track attendance trends for both members and trainers. Analyze attendance patterns to improve engagement and optimize scheduling.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
