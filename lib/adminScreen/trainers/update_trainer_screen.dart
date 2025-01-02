import 'package:flutter/material.dart';
import 'package:gym_management_app/model/trainer_model.dart';

class UpdateTrainerScreen extends StatefulWidget {
  final Trainer trainer;

  UpdateTrainerScreen({required this.trainer});

  @override
  _UpdateTrainerScreenState createState() => _UpdateTrainerScreenState();
}

class _UpdateTrainerScreenState extends State<UpdateTrainerScreen> {
  late TextEditingController nameController;
  late TextEditingController specializationController;
  late TextEditingController contactController;
  late TextEditingController availabilityController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.trainer.name);
    specializationController =
        TextEditingController(text: widget.trainer.specialization);
    contactController = TextEditingController(text: widget.trainer.contact);
    availabilityController =
        TextEditingController(text: widget.trainer.availability);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Trainer'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.edit,
                size: 100,
                color: Colors.deepPurpleAccent,
              ),
              SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: specializationController,
                decoration: InputDecoration(
                  labelText: 'Specialization',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.star),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: contactController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Contact Info',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: availabilityController,
                decoration: InputDecoration(
                  labelText: 'Availability',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calendar_today),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Update trainer details logic
                  Navigator.pop(
                    context,
                    Trainer(
                      id: widget.trainer.id,
                      name: nameController.text,
                      specialization: specializationController.text,
                      contact: contactController.text,
                      availability: availabilityController.text,
                      rating: widget.trainer.rating,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Update Trainer',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
