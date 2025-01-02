import 'package:flutter/material.dart';

class PaymentRecord {
  final String memberId;
  final String name;
  final String date;
  final double amount;
  final String method;
  final String status;

  PaymentRecord({
    required this.memberId,
    required this.name,
    required this.date,
    required this.amount,
    required this.method,
    required this.status,
  });
}

class PaymentHistoryScreen extends StatelessWidget {
  final List<PaymentRecord> paymentHistory = [
    PaymentRecord(
      memberId: "M001",
      name: "John Doe",
      date: "2024-12-15",
      amount: 100.0,
      method: "Card",
      status: "Paid",
    ),
    PaymentRecord(
      memberId: "M002",
      name: "Jane Smith",
      date: "2024-12-14",
      amount: 75.0,
      method: "Online",
      status: "Paid",
    ),
    PaymentRecord(
      memberId: "M003",
      name: "Sam Wilson",
      date: "2024-12-12",
      amount: 50.0,
      method: "Cash",
      status: "Pending",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment History'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: paymentHistory.length,
          itemBuilder: (context, index) {
            final record = paymentHistory[index];
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: CircleAvatar(
                  backgroundColor: record.status == "Paid" ? Colors.green : Colors.red,
                  child: Icon(
                    record.status == "Paid" ? Icons.check : Icons.error,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  record.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Member ID: ${record.memberId}"),
                    Text("Date: ${record.date}"),
                    Text("Method: ${record.method}"),
                  ],
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "\$${record.amount.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      record.status,
                      style: TextStyle(
                        color: record.status == "Paid" ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
