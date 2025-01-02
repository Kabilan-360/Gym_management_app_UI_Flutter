import 'package:flutter/material.dart';
import 'package:gym_management_app/adminScreen/equipmentScreen/maintenance_alert_screen.dart';
import 'equipment_list_screen.dart';

class EquipmentDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equipment Dashboard'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade300, Colors.deepPurpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50),
              // Title
              Center(
                child: Icon(
                  Icons.build,
                  size: 100,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Manage Your Equipment',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),

              // View Equipment List Button
              _buildButton(
                context,
                'View Equipment List',
                Colors.blueAccent,
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EquipmentListScreen()),
                  );
                },
              ),
              SizedBox(height: 20),

              // Maintenance Alerts Button
              _buildButton(
                context,
                'Maintenance Alerts',
                Colors.orangeAccent,
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MaintenanceAlertsScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 32),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
