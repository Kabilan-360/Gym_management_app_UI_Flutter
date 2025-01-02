import 'package:flutter/material.dart';

class CampaignPerformanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Campaign Performance'),
        backgroundColor: Colors.deepPurple, // Example non-white background color
      ),
      body: Container(
        color: Colors.black, // Non-white background for the body
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Campaigns: 5',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              'Most Successful Campaign: Summer Sale',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              'ROI of Current Campaigns: 120%',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
