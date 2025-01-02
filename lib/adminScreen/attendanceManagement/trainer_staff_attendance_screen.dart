import 'package:flutter/material.dart';

class TrainerStaffAttendanceScreen extends StatefulWidget {
  @override
  _TrainerStaffAttendanceScreenState createState() =>
      _TrainerStaffAttendanceScreenState();
}

class _TrainerStaffAttendanceScreenState
    extends State<TrainerStaffAttendanceScreen> {
  final List<Map<String, dynamic>> staffAttendance = [
    {'id': '1', 'name': 'Trainer A', 'role': 'Trainer', 'status': 'Present'},
    {'id': '2', 'name': 'Staff B', 'role': 'Staff', 'status': 'Absent'},
    {'id': '3', 'name': 'Trainer C', 'role': 'Trainer', 'status': 'Present'},
    {'id': '4', 'name': 'Staff D', 'role': 'Staff', 'status': 'Absent'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trainer & Staff Attendance'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: staffAttendance.length,
          itemBuilder: (context, index) {
            final attendance = staffAttendance[index];
            final isAbsent = attendance['status'] == 'Absent';

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
                      backgroundColor: isAbsent ? Colors.red.shade100 : Colors.green.shade100,
                      child: Icon(
                        isAbsent ? Icons.error : Icons.check,
                        color: isAbsent ? Colors.red : Colors.green,
                        size: 30,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            attendance['name'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Role: ${attendance['role']}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Status: ${attendance['status']}',
                            style: TextStyle(
                              fontSize: 14,
                              color: isAbsent ? Colors.red : Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
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
