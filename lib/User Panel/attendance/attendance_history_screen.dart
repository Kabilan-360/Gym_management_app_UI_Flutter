import 'package:flutter/material.dart';

class AttendanceHistoryScreen extends StatelessWidget {
  final List<Map<String, String>> attendanceHistory = [
    {'date': '2025-01-01', 'status': 'Present'},
    {'date': '2025-01-02', 'status': 'Absent'},
    {'date': '2025-01-03', 'status': 'Present'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance History'),
        backgroundColor: Colors.teal,
      ),
      body: attendanceHistory.isEmpty
          ? Center(
        child: Text(
          'No attendance records found.',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: attendanceHistory.length,
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          final record = attendanceHistory[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(
                record['status'] == 'Present' ? Icons.check_circle : Icons.cancel,
                color: record['status'] == 'Present' ? Colors.green : Colors.red,
              ),
              title: Text(
                'Date: ${record['date']}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Status: ${record['status']}'),
              trailing: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: record['status'] == 'Present'
                      ? Colors.green.withOpacity(0.1)
                      : Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  record['status']!,
                  style: TextStyle(
                    color: record['status'] == 'Present' ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
