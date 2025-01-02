import 'package:flutter/material.dart';
import 'package:gym_management_app/adminScreen/access_control/access_control_dashboard.dart';
import 'package:gym_management_app/adminScreen/attendanceManagement/attendance_dashboard.dart';
import 'package:gym_management_app/adminScreen/class_sessions/session_dashboard.dart';
import 'package:gym_management_app/adminScreen/dashboard/dashboard_screen.dart';
import 'package:gym_management_app/adminScreen/equipmentScreen/equipment_dashboard.dart';
import 'package:gym_management_app/adminScreen/equipmentScreen/equipment_list_screen.dart';
import 'package:gym_management_app/adminScreen/feedBackAndComplaints/complaints_dashboard.dart';
import 'package:gym_management_app/adminScreen/feedBackAndComplaints/feedback_dashboard.dart';
import 'package:gym_management_app/adminScreen/integration/integration_dashboard.dart';
import 'package:gym_management_app/adminScreen/marketing/marketing_dashboard.dart';
import 'package:gym_management_app/adminScreen/membershipScreen/membership_plans_dashboard.dart';
import 'package:gym_management_app/adminScreen/notifications/notifications_dashboard.dart';
import 'package:gym_management_app/adminScreen/paymentAndInvoices/payments_dashboard.dart';
import 'package:gym_management_app/adminScreen/progress_tracking/progress_dashboard.dart';
import 'package:gym_management_app/adminScreen/trainers/trainer_dashboard.dart';
import 'package:gym_management_app/adminScreen/userManagement/admin_screen.dart';
import 'package:gym_management_app/screens/log_in.dart';

class AdminPanel extends StatelessWidget {
  const AdminPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
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
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildAdminButton(
              context,
              title: "User Management",
              icon: Icons.people,
              color: Colors.blue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => adminScreen()),
                );
              },
            ),
            _buildAdminButton(
              context,
              title: "Membership Plans",
              icon: Icons.card_membership,
              color: Colors.green,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MembershipPlansDashboard()),
                );
              },
            ),
            _buildAdminButton(
              context,
              title: "Payments",
              icon: Icons.payment,
              color: Colors.purple,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentsDashboard()),
                );
              },
            ),
            _buildAdminButton(
              context,
              title: "Attendance",
              icon: Icons.access_alarm,
              color: Colors.black,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AttendanceDashboard()),
                );
              },
            ),
            _buildAdminButton(
              context,
              title: "Trainer Management",
              icon: Icons.fitness_center,
              color: Colors.blueAccent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrainerDashboard()),
                );
              },
            ),
            _buildAdminButton(
              context,
              title: "Equipment",
              icon: Icons.sports_handball,
              color: Colors.deepPurple,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EquipmentDashboard()),
                );
              },
            ),
            _buildAdminButton(
              context,
              title: "Session",
              icon: Icons.access_time,
              color: Colors.redAccent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SessionDashboard()),
                );
              },
            ),
            _buildAdminButton(
              context,
              title: "Progress",
              icon: Icons.bar_chart,
              color: Colors.indigo,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProgressDashboard()),
                );
              },
            ),
            _buildAdminButton(
              context,
              title: "Notifications",
              icon: Icons.notifications,
              color: Colors.teal,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationsDashboard()),
                );
              },
            ),
            _buildAdminButton(
              context,
              title: "Dashboard",
              icon: Icons.dashboard,
              color: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                );
              },
            ),
            _buildAdminButton(
              context,
              title: "Complaints",
              icon: Icons.feedback,
              color: Colors.red,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeedbackComplaintsDashboard()),
                );
              },
            ),
            _buildAdminButton(
              context,
              title: "Access Control",
              icon: Icons.security,
              color: Colors.black,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccessControlDashboard()),
                );
              },
            ),
            _buildAdminButton(
              context,
              title: "Marketing",
              icon: Icons.local_offer,
              color: Colors.greenAccent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MarketingDashboard()),
                );
              },
            ),
            _buildAdminButton(
              context,
              title: "Integration",
              icon: Icons.all_inclusive,
              color: Colors.pinkAccent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IntegrationDashboard()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdminButton(BuildContext context,
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
