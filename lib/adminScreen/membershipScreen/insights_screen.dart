import 'package:flutter/material.dart';

class InsightsScreen extends StatelessWidget {
  // Placeholder data for insights
  final List<Map<String, dynamic>> planStats = [
    {'name': 'Monthly Plan', 'members': 150, 'revenue': 1200.0},
    {'name': 'Annual Plan', 'members': 80, 'revenue': 3000.0},
    {'name': 'Quarterly Plan', 'members': 45, 'revenue': 850.0},
    {'name': 'Trial Plan', 'members': 200, 'revenue': 0.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Membership Plan Insights'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade700, Colors.purple.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Plan Popularity and Revenue',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: planStats.length,
                itemBuilder: (context, index) {
                  final plan = planStats[index];
                  return Card(
                    color: Colors.white.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(plan['name'],
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                          'Members: ${plan['members']}\nRevenue: \$${plan['revenue']}'),
                      trailing: Icon(Icons.trending_up, color: Colors.green),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                // Implement any action when the button is clicked, e.g., refresh data
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Refreshing insights...')));
              },
              child: Text(
                'Refresh Insights',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
