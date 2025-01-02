import 'package:flutter/material.dart';
import 'feedback_type_widget.dart';

class FeedbackSubmissionScreen extends StatefulWidget {
  @override
  _FeedbackSubmissionScreenState createState() => _FeedbackSubmissionScreenState();
}

class _FeedbackSubmissionScreenState extends State<FeedbackSubmissionScreen> {
  final TextEditingController _feedbackController = TextEditingController();
  String _selectedFeedbackType = 'General Feedback'; // Default type

  void _submitFeedback() {
    if (_feedbackController.text.isNotEmpty) {
      // Normally here, you'd send this data to the backend or store it locally
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Feedback submitted successfully!')),
      );

      // Clear the feedback field after submission
      _feedbackController.clear();  // Clears the text in the TextField
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter your feedback.')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback Submission'),
        backgroundColor: Colors.teal, // Matching the theme color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Feedback type widget
            FeedbackTypeWidget(
              selectedFeedbackType: _selectedFeedbackType,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedFeedbackType = newValue ?? 'General Feedback';
                });
              },
            ),
            SizedBox(height: 20),
            // Feedback input field
            Text(
              'Your Feedback:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _feedbackController,
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                hintText: 'Enter your feedback here...',
                contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              ),
            ),
            SizedBox(height: 20),
            // Submit button with improved styling
            ElevatedButton(
              onPressed: _submitFeedback,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
                backgroundColor: Colors.teal, // Matching button color
              ),
              child: Text(
                'Submit Feedback',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
