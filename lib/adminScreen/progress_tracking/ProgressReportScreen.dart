import 'package:flutter/material.dart';

class ProgressReportScreen extends StatelessWidget {
  // Sample data for member progress
  final List<Map<String, dynamic>> progressData = [
    {
      'date': '2024-01-01',
      'weight': 70.0,
      'bmi': 22.5,
      'goalWeight': 68.0,
      'goalBmi': 22.0,
    },
    {
      'date': '2024-02-01',
      'weight': 68.0,
      'bmi': 22.0,
      'goalWeight': 65.0,
      'goalBmi': 21.5,
    },
    {
      'date': '2024-03-01',
      'weight': 66.0,
      'bmi': 21.5,
      'goalWeight': 65.0,
      'goalBmi': 21.5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member Progress Report'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Progress Report for Member: John Doe',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),

            // List of progress records
            Expanded(
              child: ListView.builder(
                itemCount: progressData.length,
                itemBuilder: (context, index) {
                  final progress = progressData[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    elevation: 4,
                    child: ListTile(
                      title: Text('Date: ${progress['date']}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Weight: ${progress['weight']} kg'),
                          Text('BMI: ${progress['bmi']}'),
                          Text('Goal Weight: ${progress['goalWeight']} kg'),
                          Text('Goal BMI: ${progress['goalBmi']}'),
                        ],
                      ),
                      trailing: Icon(
                        Icons.assignment_turned_in,
                        color: Colors.green,
                      ),
                    ),
                  );
                },
              ),
            ),

            // Optionally, you can add a button to generate a PDF report or export data.
            ElevatedButton(
              onPressed: () {
                // Placeholder for PDF export or further functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Exporting Report...')),
                );
              },
              child: Text('Export Report'),
            ),
          ],
        ),
      ),
    );
  }
}
