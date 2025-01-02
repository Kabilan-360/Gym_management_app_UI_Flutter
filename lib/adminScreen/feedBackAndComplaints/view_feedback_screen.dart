import 'package:flutter/material.dart';

class ViewFeedbackScreen extends StatelessWidget {
  final List<Map<String, String>> dummyFeedback = [
    {
      'title': 'Broken Treadmill',
      'category': 'Equipment',
      'description': 'The treadmill in the corner is not working properly.',
    },
    {
      'title': 'Great Yoga Session',
      'category': 'Service',
      'description': 'The yoga sessions are very relaxing and well-organized.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Feedback'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
        child: ListView.builder(
          itemCount: dummyFeedback.length,
          itemBuilder: (context, index) {
            final feedback = dummyFeedback[index];
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Text(
                  feedback['title']!,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '${feedback['category']} - ${feedback['description']}',
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.check_circle, color: Colors.green),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Marked as resolved')),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
