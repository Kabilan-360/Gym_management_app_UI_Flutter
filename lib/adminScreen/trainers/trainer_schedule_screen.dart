import 'package:flutter/material.dart';

class TrainerScheduleScreen extends StatelessWidget {
  final List<Map<String, dynamic>> trainerSchedules = [
    {
      'name': 'Trainer A',
      'schedule': [
        {'day': 'Monday', 'time': '9:00 AM - 12:00 PM'},
        {'day': 'Wednesday', 'time': '1:00 PM - 4:00 PM'},
      ],
    },
    {
      'name': 'Trainer B',
      'schedule': [
        {'day': 'Tuesday', 'time': '10:00 AM - 1:00 PM'},
        {'day': 'Thursday', 'time': '2:00 PM - 5:00 PM'},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trainer Schedules'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: trainerSchedules.isEmpty
          ? Center(
        child: Text(
          'No schedules available!',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: trainerSchedules.length,
          itemBuilder: (context, index) {
            final trainer = trainerSchedules[index];
            return Card(
              margin: EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              child: ExpansionTile(
                title: Text(
                  trainer['name'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                leading: Icon(
                  Icons.person,
                  color: Colors.deepPurpleAccent,
                ),
                children: trainer['schedule']
                    .map<Widget>(
                      (schedule) => ListTile(
                    leading: Icon(Icons.calendar_today),
                    title: Text(
                      schedule['day'],
                      style: TextStyle(fontSize: 16),
                    ),
                    subtitle: Text(
                      schedule['time'],
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                )
                    .toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
