import 'package:flutter/material.dart';

class MemberAttendanceScreen extends StatefulWidget {
  @override
  _MemberAttendanceScreenState createState() => _MemberAttendanceScreenState();
}

class _MemberAttendanceScreenState extends State<MemberAttendanceScreen> {
  final List<Map<String, dynamic>> memberAttendance = [
    {'id': '1', 'name': 'John Doe', 'checkIn': '9:00 AM', 'checkOut': '11:00 AM'},
    {'id': '2', 'name': 'Jane Smith', 'checkIn': '10:00 AM', 'checkOut': '12:30 PM'},
    {'id': '3', 'name': 'Alice Johnson', 'checkIn': '8:45 AM', 'checkOut': null},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member Attendance'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: memberAttendance.length,
          itemBuilder: (context, index) {
            final attendance = memberAttendance[index];
            final isPending = attendance['checkOut'] == null;

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.teal.shade100,
                      child: Text(
                        attendance['name'][0],
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            attendance['name'],
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Check-In: ${attendance['checkIn']}',
                            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                          ),
                          Text(
                            'Check-Out: ${isPending ? "Pending" : attendance['checkOut']}',
                            style: TextStyle(
                              fontSize: 14,
                              color: isPending ? Colors.red : Colors.grey[700],
                              fontWeight: isPending ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      isPending ? Icons.error_outline : Icons.check_circle_outline,
                      color: isPending ? Colors.red : Colors.green,
                      size: 28,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
