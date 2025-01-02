import 'package:flutter/material.dart';

class FeedbackTypeWidget extends StatelessWidget {
  final String? selectedFeedbackType; // Allow null value for selectedFeedbackType
  final ValueChanged<String?> onChanged; // Expecting nullable String

  FeedbackTypeWidget({
    required this.selectedFeedbackType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Feedback Type:', style: TextStyle(fontSize: 16)),
        DropdownButton<String?>(
          value: selectedFeedbackType,
          onChanged: onChanged,
          items: <String>['General Feedback', 'Complaint', 'Suggestion']
              .map<DropdownMenuItem<String?>>((String value) {
            return DropdownMenuItem<String?>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
