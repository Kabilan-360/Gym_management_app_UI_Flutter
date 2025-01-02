import 'package:flutter/material.dart';
import 'package:gym_management_app/model/session_model.dart';
import 'add_session_screen.dart';
import 'update_session_screen.dart';
import 'session_attendance_screen.dart';

class SessionListScreen extends StatelessWidget {
  final List<Session> sessionList = [
    Session(
      id: '1',
      name: 'Yoga Session',
      type: 'Yoga',
      date: DateTime.now().add(Duration(days: 1)),
      trainerId: 'T1',
      memberIds: ['M1', 'M2'],
      capacity: 20,
      status: 'Active',
    ),
    Session(
      id: '2',
      name: 'Zumba Dance',
      type: 'Zumba',
      date: DateTime.now().add(Duration(days: 2)),
      trainerId: 'T2',
      memberIds: ['M1'],
      capacity: 15,
      status: 'Inactive',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class/Session List'),
        backgroundColor: Colors.deepOrange, // You can change the color as needed
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: sessionList.length,
          itemBuilder: (context, index) {
            final session = sessionList[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              elevation: 5,
              child: ListTile(
                title: Text(
                  session.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Type: ${session.type}'),
                    Text('Capacity: ${session.capacity}'),
                    Text('Date: ${session.date.toLocal()}'.split(' ')[0]), // Format date
                    Row(
                      children: [
                        Icon(
                          session.status == 'Active'
                              ? Icons.check_circle
                              : Icons.cancel,
                          color: session.status == 'Active'
                              ? Colors.green
                              : Colors.red,
                        ),
                        SizedBox(width: 5),
                        Text(
                          session.status,
                          style: TextStyle(
                            color: session.status == 'Active'
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            UpdateSessionScreen(session: session),
                      ),
                    );
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SessionAttendanceScreen(sessionId: session.id),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddSessionScreen()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange, // You can change the color here as well
        elevation: 6.0,
      ),
    );
  }
}
