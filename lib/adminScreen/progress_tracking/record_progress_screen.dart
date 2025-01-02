import 'package:flutter/material.dart';
import 'package:gym_management_app/model/progress_model.dart'; // Ensure the model is correct

class RecordProgressScreen extends StatefulWidget {
  @override
  _RecordProgressScreenState createState() => _RecordProgressScreenState();
}

class _RecordProgressScreenState extends State<RecordProgressScreen> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController bmiController = TextEditingController();
  final TextEditingController goalWeightController = TextEditingController();
  final TextEditingController goalBmiController = TextEditingController();

  void _saveProgress() {
    if (weightController.text.isEmpty ||
        bmiController.text.isEmpty ||
        goalWeightController.text.isEmpty ||
        goalBmiController.text.isEmpty) {
      // Display error message if any field is empty
      _showSnackbar('Please fill in all fields.');
      return;
    }

    try {
      final progress = Progress(
        memberId: 'M1', // Here we assume a member ID, you can replace it with actual member info
        date: DateTime.now(),
        weight: double.parse(weightController.text),
        bmi: double.parse(bmiController.text),
        goalWeight: double.parse(goalWeightController.text),
        goalBmi: double.parse(goalBmiController.text),
      );

      // Simulate saving the progress (could be done using a database or state management solution)
      _showSnackbar('Progress saved successfully!');

      // Clear fields after saving progress
      weightController.clear();
      bmiController.clear();
      goalWeightController.clear();
      goalBmiController.clear();

      // Optionally navigate back or to another screen
      Navigator.pop(context);
    } catch (e) {
      // Handle error if the data is not valid
      _showSnackbar('Please enter valid numerical values.');
    }
  }

  void _showSnackbar(String message) {
    // Use ScaffoldMessenger to show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Record Progress'),
        backgroundColor: Colors.teal,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Track Your Progress',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: 20),
              _buildTextField(
                controller: weightController,
                label: 'Current Weight (kg)',
                icon: Icons.fitness_center,
              ),
              _buildTextField(
                controller: bmiController,
                label: 'Current BMI',
                icon: Icons.accessibility,
              ),
              _buildTextField(
                controller: goalWeightController,
                label: 'Goal Weight (kg)',
                icon: Icons.assessment,
              ),
              _buildTextField(
                controller: goalBmiController,
                label: 'Goal BMI',
                icon: Icons.equalizer,
              ),
              SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: _saveProgress,
                icon: Icon(Icons.save),
                label: Text('Save Progress'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.teal),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          labelStyle: TextStyle(color: Colors.teal),
        ),
        keyboardType: TextInputType.numberWithOptions(decimal: true),
      ),
    );
  }
}
