import 'package:flutter/material.dart';
import 'feebback_item.dart';
import 'feedback_service.dart';

class ResolveComplaintScreen extends StatelessWidget {
  final FeedbackItem complaint;

  const ResolveComplaintScreen({super.key, required this.complaint});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resolve Complaint')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              complaint.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Category: ${complaint.category}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Date: ${complaint.date}',
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Mark the complaint as resolved
                Navigator.pop(context);
              },
              child: const Text('Mark as Resolved'),
            ),
          ],
        ),
      ),
    );
  }
}
