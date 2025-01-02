import 'package:flutter/material.dart';
import 'attendance_history_screen.dart';
import 'check_in_screen.dart';

class AttendanceDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance & Check-ins'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildAttendanceButton(
              context,
              title: "View Attendance History",
              icon: Icons.history,
              color: Colors.blue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AttendanceHistoryScreen()),
                );
              },
            ),
            SizedBox(height: 16),
            _buildAttendanceButton(
              context,
              title: "Check In (QR Code Dummy)",
              icon: Icons.qr_code_scanner,
              color: Colors.green,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckInScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Reusable button widget
  Widget _buildAttendanceButton(
      BuildContext context, {
        required String title,
        required IconData icon,
        required Color color,
        required VoidCallback onTap,
      }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
        backgroundColor: color.withOpacity(0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      icon: Icon(icon, color: color),
      label: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
      ),
    );
  }
}
