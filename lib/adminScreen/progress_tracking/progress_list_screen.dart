import 'package:flutter/material.dart';
import 'package:gym_management_app/model/progress_model.dart';
import 'record_progress_screen.dart';
import 'progress_report_screen.dart';

class ProgressListScreen extends StatelessWidget {
  final List<Progress> progressList = [
    Progress(
      memberId: 'M1',
      date: DateTime.now().subtract(Duration(days: 30)),
      weight: 75.0,
      bmi: 23.5,
      goalWeight: 70.0,
      goalBmi: 22.0,
    ),
    Progress(
      memberId: 'M2',
      date: DateTime.now().subtract(Duration(days: 60)),
      weight: 85.0,
      bmi: 27.5,
      goalWeight: 80.0,
      goalBmi: 25.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Tracking'),
        backgroundColor: Colors.deepPurple, // Color of the app bar
      ),
      body: ListView.builder(
        itemCount: progressList.length,
        itemBuilder: (context, index) {
          final progress = progressList[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(16.0),
              title: Text('Member ID: ${progress.memberId}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Weight: ${progress.weight} kg',
                      style: TextStyle(fontSize: 16)),
                  Text('BMI: ${progress.bmi}',
                      style: TextStyle(fontSize: 16)),
                  Text('Goal Weight: ${progress.goalWeight} kg',
                      style: TextStyle(fontSize: 16)),
                  Text('Goal BMI: ${progress.goalBmi}',
                      style: TextStyle(fontSize: 16)),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.report, color: Colors.blue),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProgressReportScreen(progress: progress),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RecordProgressScreen()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
