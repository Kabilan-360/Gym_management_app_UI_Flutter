import 'package:flutter/material.dart';

class AddFeedbackScreen extends StatefulWidget {
  @override
  _AddFeedbackScreenState createState() => _AddFeedbackScreenState();
}

class _AddFeedbackScreenState extends State<AddFeedbackScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String selectedCategory = 'Service';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Feedback'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title Input
            _buildTextField(
              controller: titleController,
              label: 'Title',
              hint: 'Enter the feedback title',
            ),

            SizedBox(height: 15),

            // Description Input
            _buildTextField(
              controller: descriptionController,
              label: 'Description',
              hint: 'Provide detailed feedback',
              maxLines: 3,
            ),

            SizedBox(height: 15),

            // Category Dropdown
            _buildDropdown(),

            SizedBox(height: 30),

            // Submit Button
            _buildSubmitButton(context),
          ],
        ),
      ),
    );
  }

  // Custom TextField builder
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.teal),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.teal),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.teal.withOpacity(0.6)),
        ),
      ),
    );
  }

  // Category Dropdown
  Widget _buildDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButton<String>(
        value: selectedCategory,
        onChanged: (value) {
          setState(() {
            selectedCategory = value!;
          });
        },
        items: ['Service', 'Trainer', 'Equipment']
            .map((category) => DropdownMenuItem(
          value: category,
          child: Text(
            category,
            style: TextStyle(fontSize: 16),
          ),
        ))
            .toList(),
        isExpanded: true,
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }


  // Submit Button
  Widget _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Feedback added successfully!')),
        );
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
      ),
      child: Text(
        'Submit Feedback',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
