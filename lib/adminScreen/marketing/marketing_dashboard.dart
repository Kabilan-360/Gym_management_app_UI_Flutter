import 'package:flutter/material.dart';
import 'campaign_creation_screen.dart';
import 'referral_program_screen.dart';
import 'campaign_performance_screen.dart';

class MarketingDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marketing and Offers'),
        backgroundColor: Colors.deepPurple,
        elevation: 4.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade300, Colors.deepPurple.shade800],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildButton(
                context: context,
                label: 'Create Campaign',
                icon: Icons.campaign_outlined,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CampaignCreationScreen()),
                  );
                },
              ),
              SizedBox(height: 20),
              _buildButton(
                context: context,
                label: 'Manage Referral Programs',
                icon: Icons.card_giftcard_outlined,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReferralProgramScreen()),
                  );
                },
              ),
              SizedBox(height: 20),
              _buildButton(
                context: context,
                label: 'Campaign Performance',
                icon: Icons.analytics_outlined,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CampaignPerformanceScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple.shade600,
        padding: EdgeInsets.symmetric(vertical: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      icon: Icon(icon, color: Colors.white, size: 24),
      label: Text(
        label,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
