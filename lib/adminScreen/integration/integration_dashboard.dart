import 'package:flutter/material.dart';
import 'payment_gateway_screen.dart';
import 'wearable_device_screen.dart';
import 'crm_tools_screen.dart';

class IntegrationDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('External Tools Integration'),
        backgroundColor: Colors.teal,
        elevation: 4.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.teal.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildIntegrationTile(
                context,
                'Payment Gateway Integration',
                Icons.payment,
                PaymentGatewayScreen(),
              ),
              SizedBox(height: 20),
              _buildIntegrationTile(
                context,
                'Wearable Device Integration',
                Icons.watch_later,
                WearableDeviceScreen(),
              ),
              SizedBox(height: 20),
              _buildIntegrationTile(
                context,
                'CRM/Marketing Tools',
                Icons.shop,
                CRMToolsScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIntegrationTile(BuildContext context, String title, IconData icon, Widget nextScreen) {
    return Card(
      elevation: 5.0,
      shadowColor: Colors.black38,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal, size: 32),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(Icons.arrow_forward, color: Colors.teal),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => nextScreen),
          );
        },
      ),
    );
  }
}
