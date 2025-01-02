import 'package:flutter/material.dart';
import 'package:gym_management_app/adminScreen/trainers/update_trainer_screen.dart';
import 'package:gym_management_app/model/trainer_model.dart';

class TrainerListScreen extends StatefulWidget {
  @override
  _TrainerListScreenState createState() => _TrainerListScreenState();
}

class _TrainerListScreenState extends State<TrainerListScreen> {
  List<Trainer> trainers = [
    Trainer(
      id: '1',
      name: 'John Doe',
      specialization: 'Yoga',
      contact: '1234567890',
      availability: 'Mon-Fri',
      rating: 4.5,
    ),
    Trainer(
      id: '2',
      name: 'Jane Smith',
      specialization: 'Weight Training',
      contact: '0987654321',
      availability: 'Tue-Thu',
      rating: 4.8,
    ),
  ];

  void deleteTrainer(String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this trainer?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  trainers.removeWhere((trainer) => trainer.id == id);
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Yes', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Trainer List')),
      body: trainers.isEmpty
          ? Center(
        child: Text(
          'No trainers available!',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: trainers.length,
        itemBuilder: (context, index) {
          final trainer = trainers[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.deepOrange,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(
                trainer.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${trainer.specialization} - ${trainer.contact}',
                style: TextStyle(color: Colors.grey),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => deleteTrainer(trainer.id),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateTrainerScreen(trainer: trainer),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
