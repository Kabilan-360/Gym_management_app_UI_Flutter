import 'package:flutter/material.dart';
import 'package:gym_management_app/User%20Panel/Payment_history/payment_history_screen.dart';
import 'package:gym_management_app/User%20Panel/profile_management/user_dashboard.dart';
import 'package:gym_management_app/User%20Panel/workout_diet/workout_dashboard.dart';
import 'package:gym_management_app/screens/log_in.dart';

// import '../adminScreen/attendanceManagement/attendance_dashboard.dart';
import 'attendance/attendance_dashboard.dart';
import 'feedback/feedback_submission_screen.dart';
import 'notifications/notifications_screen.dart';
import 'session_bookings/session_booking_screen.dart';

class UserPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Panel'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Welcome, User!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildUserButton(
                    context,
                    title: "My Profile",
                    icon: Icons.person,
                    color: Colors.blue,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>UserDashboard()));
                    },
                  ),

                  _buildUserButton(
                    context,
                    title: "Attendance",
                    icon: Icons.check_circle,
                    color: Colors.green,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AttendanceDashboard()));
                    },
                  ),

                  _buildUserButton(
                    context,
                    title: "Workout Plans",
                    icon: Icons.fitness_center,
                    color: Colors.purple,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>WorkoutDietDashboard()));
                    },
                  ),
                  _buildUserButton(
                    context,
                    title: "Payment History",
                    icon: Icons.bar_chart,
                    color: Colors.black,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentHistoryScreen()));
                    },
                  ),

                  _buildUserButton(
                    context,
                    title: "Session Screen",
                    icon: Icons.meeting_room_outlined,
                    color: Colors.teal,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SessionBookingScreen()));
                    },
                  ),
                  _buildUserButton(
                    context,
                    title: "Notifications",
                    icon: Icons.notifications,
                    color: Colors.redAccent,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationsScreen()));
                    },
                  ),

                  _buildUserButton(
                    context,
                    title: "FeedBack",
                    icon: Icons.help,
                    color: Colors.redAccent,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>FeedbackSubmissionScreen()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserButton(BuildContext context,
      {required String title, required IconData icon, required Color color, required VoidCallback onTap}) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color.withOpacity(0.1),
        padding: EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 5,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 40),
          SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    );
  }
}
