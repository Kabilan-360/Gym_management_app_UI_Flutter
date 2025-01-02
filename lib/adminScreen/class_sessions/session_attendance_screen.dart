import 'package:flutter/material.dart';

class SessionAttendanceScreen extends StatefulWidget {
  final String sessionId;

  SessionAttendanceScreen({required this.sessionId});

  @override
  _SessionAttendanceScreenState createState() =>
      _SessionAttendanceScreenState();
}

class _SessionAttendanceScreenState extends State<SessionAttendanceScreen> {
  List<Map<String, String>> members = [
    {'name': 'John Doe', 'status': 'Absent'},
    {'name': 'Jane Smith', 'status': 'Present'},
    {'name': 'Sam Wilson', 'status': 'Absent'},
    {'name': 'Anna Belle', 'status': 'Present'},
  ];

  void _toggleAttendance(int index) {
    setState(() {
      members[index]['status'] =
      members[index]['status'] == 'Present' ? 'Absent' : 'Present';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Session Attendance'),
        backgroundColor: Colors.deepOrange, // AppBar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Session Information
            Text(
              'Session ID: ${widget.sessionId}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // Attendance List
            Expanded(
              child: ListView.builder(
                itemCount: members.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        members[index]['name']!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Status: ${members[index]['status']}'),
                      trailing: IconButton(
                        icon: Icon(
                          members[index]['status'] == 'Present'
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color: members[index]['status'] == 'Present'
                              ? Colors.green
                              : Colors.red,
                        ),
                        onPressed: () => _toggleAttendance(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
