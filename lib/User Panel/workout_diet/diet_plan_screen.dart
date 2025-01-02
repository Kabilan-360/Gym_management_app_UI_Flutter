import 'package:flutter/material.dart';

class DietPlanScreen extends StatelessWidget {
  final List<Map<String, String>> dietPlans = [
    {'meal': 'Breakfast', 'description': 'Oatmeal, Eggs, and Fruit'},
    {'meal': 'Lunch', 'description': 'Grilled Chicken, Quinoa, and Salad'},
    {'meal': 'Dinner', 'description': 'Salmon, Brown Rice, and Vegetables'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diet Plans'),
        backgroundColor: Colors.teal,
        elevation: 8,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.tealAccent, Colors.teal],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: dietPlans.length,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          itemBuilder: (context, index) {
            final plan = dietPlans[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: Icon(Icons.fastfood, color: Colors.white),
                ),
                title: Text(
                  plan['meal']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                subtitle: Text(
                  plan['description']!,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.teal),
              ),
            );
          },
        ),
      ),
    );
  }
}
