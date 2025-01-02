import 'package:flutter/material.dart';

class WearableDeviceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wearable Device Integration'),
        backgroundColor: Colors.orangeAccent,
        elevation: 4.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade100, Colors.orange.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sync Your Wearable Devices',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 20),
              _buildSyncButton(
                context,
                'Fitbit',
                Icons.fitness_center,
                Colors.green,
                'Fitbit Synced',
              ),
              SizedBox(height: 20),
              _buildSyncButton(
                context,
                'Garmin',
                Icons.run_circle,
                Colors.blueAccent,
                'Garmin Synced',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSyncButton(BuildContext context, String deviceName, IconData icon, Color color, String successMessage) {
    return ElevatedButton.icon(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(successMessage)),
        );
      },
      icon: Icon(icon, color: Colors.white),
      label: Text(
        'Connect $deviceName',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
