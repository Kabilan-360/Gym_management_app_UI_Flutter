import 'package:flutter/material.dart';

class Reminder {
  final String memberName;
  final String paymentDueDate;
  final double amountDue;

  Reminder({
    required this.memberName,
    required this.paymentDueDate,
    required this.amountDue,
  });
}

class RemindersScreen extends StatelessWidget {
  final List<Reminder> reminders = [
    Reminder(memberName: "John Doe", paymentDueDate: "2024-12-30", amountDue: 100.0),
    Reminder(memberName: "Jane Smith", paymentDueDate: "2024-12-28", amountDue: 75.0),
    Reminder(memberName: "Sam Wilson", paymentDueDate: "2024-12-27", amountDue: 50.0),
  ];

  void sendReminder(BuildContext context, String memberName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Reminder sent to $memberName!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Reminders'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: reminders.length,
          itemBuilder: (context, index) {
            final reminder = reminders[index];
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.notification_important, color: Colors.white),
                ),
                title: Text(
                  reminder.memberName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Payment Due: ${reminder.paymentDueDate}"),
                    Text("Amount Due: \$${reminder.amountDue.toStringAsFixed(2)}"),
                  ],
                ),
                trailing: ElevatedButton(
                  onPressed: () => sendReminder(context, reminder.memberName),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Send"),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
