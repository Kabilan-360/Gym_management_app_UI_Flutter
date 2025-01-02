import 'package:flutter/material.dart';
import 'package:gym_management_app/model/trainer_model.dart';

class AddTrainerScreen extends StatefulWidget {
  @override
  _AddTrainerScreenState createState() => _AddTrainerScreenState();
}

class _AddTrainerScreenState extends State<AddTrainerScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController specializationController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController availabilityController = TextEditingController();

  List<Trainer> trainers = [];

  void addTrainer() {
    if (nameController.text.isNotEmpty &&
        specializationController.text.isNotEmpty &&
        contactController.text.isNotEmpty &&
        availabilityController.text.isNotEmpty) {
      setState(() {
        trainers.add(
          Trainer(
            id: DateTime.now().toString(),
            name: nameController.text,
            specialization: specializationController.text,
            contact: contactController.text,
            availability: availabilityController.text,
            rating: 0.0,
          ),
        );
        nameController.clear();
        specializationController.clear();
        contactController.clear();
        availabilityController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Trainer'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Icon(
                      Icons.fitness_center,
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
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: addTrainer,
                      style: ElevatedButton.styleFrom(
                        padding:
                        EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                        backgroundColor: Colors.deepPurpleAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Save Trainer',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: trainers.isEmpty
                  ? Center(
                child: Text(
                  'No trainers added yet!',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
                  : ListView.builder(
                itemCount: trainers.length,
                itemBuilder: (context, index) {
                  final trainer = trainers[index];
                  return Card(
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      title: Text(trainer.name),
                      subtitle: Text(
                          'Specialization: ${trainer.specialization}\nAvailability: ${trainer.availability}'),
                      trailing: Icon(Icons.star, color: Colors.amber),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
