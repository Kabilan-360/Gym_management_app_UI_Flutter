import 'package:flutter/material.dart';

class CampaignCreationScreen extends StatefulWidget {
  @override
  _CampaignCreationScreenState createState() => _CampaignCreationScreenState();
}

class _CampaignCreationScreenState extends State<CampaignCreationScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Campaign'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campaign Title Input
            Text(
              'Campaign Title',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Enter the title of the campaign',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            ),
            SizedBox(height: 20),

            // Description Input
            Text(
              'Description',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: 'Provide a brief description',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),

            // Start Date Picker
            Text(
              'Start Date',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ElevatedButton.icon(
              icon: Icon(Icons.date_range),
              label: Text(
                startDate != null
                    ? startDate!.toLocal().toString().split(' ')[0]
                    : 'Select Start Date',
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              onPressed: () async {
                DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (date != null) setState(() => startDate = date);
              },
            ),
            SizedBox(height: 20),

            // End Date Picker
            Text(
              'End Date',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
            ),
            SizedBox(height: 8),
            ElevatedButton.icon(
              icon: Icon(Icons.date_range),
              label: Text(
                endDate != null
                    ? endDate!.toLocal().toString().split(' ')[0]
                    : 'Select End Date',
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white
              ),
              onPressed: () async {
                DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (date != null) setState(() => endDate = date);
              },
            ),
            SizedBox(height: 30),

            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (titleController.text.isEmpty || descriptionController.text.isEmpty || startDate == null || endDate == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please fill out all fields!'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Campaign Created: ${titleController.text}'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Create Campaign',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
