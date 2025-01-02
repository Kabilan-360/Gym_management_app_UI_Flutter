import 'package:flutter/material.dart';
import 'package:gym_management_app/model/session_model.dart';

class AddSessionScreen extends StatefulWidget {
  @override
  _AddSessionScreenState createState() => _AddSessionScreenState();
}

class _AddSessionScreenState extends State<AddSessionScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();
  DateTime sessionDate = DateTime.now();
  final List<String> memberIds = []; // List to store member IDs

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Session'),
        backgroundColor: Colors.deepOrange, // Customize the color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(  // Allow for scrolling if keyboard appears
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Session Name
              _buildTextField(nameController, 'Session Name'),

              SizedBox(height: 16),

              // Session Type
              _buildTextField(typeController, 'Session Type'),

              SizedBox(height: 16),

              // Session Capacity
              _buildTextField(capacityController, 'Session Capacity', isNumber: true),

              SizedBox(height: 16),

              // Date Picker for Session Date
              Text(
                'Session Date: ${sessionDate.toLocal()}'.split(' ')[0],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: sessionDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2101),
                  );
                  if (selectedDate != null && selectedDate != sessionDate) {
                    setState(() {
                      sessionDate = selectedDate;
                    });
                  }
                },
                child: Text('Pick a Date'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              ),

              SizedBox(height: 24),

              // Add Session Button
              _buildElevatedButton(context),
            ],
          ),
        ),
      ),
    );
  }

  // Custom TextField builder for reusability
  Widget _buildTextField(TextEditingController controller, String label, {bool isNumber = false}) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      ),
    );
  }

  // Custom Elevated Button
  Widget _buildElevatedButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final newSession = Session(
          id: DateTime.now().toString(),
          name: nameController.text,
          type: typeController.text,
          date: sessionDate,
          trainerId: 'T1', // Assuming a default trainer for now
          memberIds: memberIds,
          capacity: int.parse(capacityController.text),
          status: 'Active',
        );
        // Add the session to the list (ideally to a database or state management solution)
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepOrange,  // Customize the button color
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        'Add Session',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
