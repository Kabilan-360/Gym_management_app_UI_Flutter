import 'package:flutter/material.dart';

class CRMToolsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRM/Marketing Tools Integration'),
        backgroundColor: Colors.blueAccent,
        elevation: 4.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.blue.shade300],
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
                'Connect Your CRM & Marketing Tools',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 20),
              _buildConnectButton(
                context,
                'Mailchimp',
                Icons.mail,
                Colors.orangeAccent,
                'Connected to Mailchimp',
              ),
              SizedBox(height: 20),
              _buildConnectButton(
                context,
                'Twilio',
                Icons.sms,
                Colors.greenAccent,
                'Connected to Twilio',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConnectButton(BuildContext context, String toolName, IconData icon, Color color, String successMessage) {
    return ElevatedButton.icon(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(successMessage)),
        );
      },
      icon: Icon(icon, color: Colors.white),
      label: Text(
        'Connect to $toolName',
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
