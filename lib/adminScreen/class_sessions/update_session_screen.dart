import 'package:flutter/material.dart';
import 'package:gym_management_app/model/session_model.dart';
// import 'session_model.dart';

class UpdateSessionScreen extends StatefulWidget {
  final Session session;

  UpdateSessionScreen({required this.session});

  @override
  _UpdateSessionScreenState createState() => _UpdateSessionScreenState();
}

class _UpdateSessionScreenState extends State<UpdateSessionScreen> {
  late TextEditingController nameController;
  late TextEditingController typeController;
  late TextEditingController capacityController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.session.name);
    typeController = TextEditingController(text: widget.session.type);
    capacityController = TextEditingController(text: widget.session.capacity.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Session')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Session Name'),
            ),
            TextField(
              controller: typeController,
              decoration: InputDecoration(labelText: 'Session Type'),
            ),
            TextField(
              controller: capacityController,
              decoration: InputDecoration(labelText: 'Session Capacity'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final updatedSession = Session(
                  id: widget.session.id,
                  name: nameController.text,
                  type: typeController.text,
                  date: widget.session.date,
                  trainerId: widget.session.trainerId,
                  memberIds: widget.session.memberIds,
                  capacity: int.parse(capacityController.text),
                  status: widget.session.status,
                );
                // Update the session in the list (ideally in a database or state management)
                Navigator.pop(context);
              },
              child: Text('Update Session'),
            ),
          ],
        ),
      ),
    );
  }
}
