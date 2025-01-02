import 'package:flutter/material.dart';

class WorkoutRoutineScreen extends StatelessWidget {
  final List<Map<String, String>> routines = [
    {'name': 'Full Body Workout', 'duration': '45 mins'},
    {'name': 'Cardio Session', 'duration': '30 mins'},
    {'name': 'Strength Training', 'duration': '60 mins'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Routines'),
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
          itemCount: routines.length,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          itemBuilder: (context, index) {
            final routine = routines[index];
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
                  child: Icon(Icons.fitness_center, color: Colors.white),
                ),
                title: Text(
                  routine['name']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                subtitle: Text(
                  'Duration: ${routine['duration']}',
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
