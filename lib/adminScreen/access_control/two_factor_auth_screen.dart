import 'package:flutter/material.dart';

class TwoFactorAuthScreen extends StatefulWidget {
  @override
  _TwoFactorAuthScreenState createState() => _TwoFactorAuthScreenState();
}

class _TwoFactorAuthScreenState extends State<TwoFactorAuthScreen> {
  bool is2FAEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Two-Factor Authentication'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              is2FAEnabled ? Icons.lock_outline : Icons.lock_open,
              color: is2FAEnabled ? Colors.green : Colors.red,
              size: 80,
            ),
            SizedBox(height: 20),
            Text(
              is2FAEnabled
                  ? 'Two-Factor Authentication is Enabled'
                  : 'Two-Factor Authentication is Disabled',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: is2FAEnabled ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(height: 30),
            SwitchListTile(
              title: Text(
                'Enable Two-Factor Authentication',
                style: TextStyle(fontSize: 16),
              ),
              value: is2FAEnabled,
              activeColor: Colors.deepPurple,
              onChanged: (value) {
                setState(() {
                  is2FAEnabled = value;
                });
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Toggle the state and display a confirmation message
                setState(() {
                  is2FAEnabled = !is2FAEnabled;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      is2FAEnabled
                          ? 'Two-Factor Authentication Enabled'
                          : 'Two-Factor Authentication Disabled',
                    ),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                is2FAEnabled ? 'Disable 2FA' : 'Enable 2FA',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
