import 'package:flutter/material.dart';
import 'package:gym_management_app/model/progress_model.dart';
import 'package:intl/intl.dart'; // Import to format date

class ProgressReportScreen extends StatelessWidget {
  final Progress progress;

  ProgressReportScreen({required this.progress});

  @override
  Widget build(BuildContext context) {
    // Format the date
    String formattedDate = DateFormat('yyyy-MM-dd').format(progress.date);

    return Scaffold(
      appBar: AppBar(title: Text('Progress Report')),
      body: SingleChildScrollView( // Make it scrollable in case content overflows
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Member Info
            Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Member ID: ${progress.memberId}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text('Date: $formattedDate', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),

            // Progress Info
            Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Weight: ${progress.weight} kg', style: TextStyle(fontSize: 18)),
                    Text('BMI: ${progress.bmi}', style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10),
                    Text('Goal Weight: ${progress.goalWeight} kg', style: TextStyle(fontSize: 18)),
                    Text('Goal BMI: ${progress.goalBmi}', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),

            // Achievement Status
            Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      progress.isMilestoneAchieved() ? Icons.check_circle : Icons.warning,
                      color: progress.isMilestoneAchieved() ? Colors.green : Colors.orange,
                      size: 30,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        progress.isMilestoneAchieved()
                            ? 'Congratulations! You have achieved your goals!'
                            : 'Keep working hard, you are almost there!',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
