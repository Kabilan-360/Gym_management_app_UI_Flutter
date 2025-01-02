import 'package:flutter/material.dart';

class PaymentGatewayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Gateway Integration'),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Connect to Payment Gateways',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 20),
              _buildGatewayButton(
                context,
                'PayPal',
                Icons.payment,
                Colors.blueAccent,
                'Connected to PayPal',
              ),
              SizedBox(height: 20),
              _buildGatewayButton(
                context,
                'Stripe',
                Icons.credit_card,
                Colors.blue,
                'Connected to Stripe',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGatewayButton(BuildContext context, String gatewayName, IconData icon, Color color, String successMessage) {
    return ElevatedButton.icon(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(successMessage)),
        );
      },
      icon: Icon(icon, color: Colors.white),
      label: Text(
        'Connect to $gatewayName',
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
