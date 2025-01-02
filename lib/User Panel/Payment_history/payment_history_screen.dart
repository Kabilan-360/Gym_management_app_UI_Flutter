import 'package:flutter/material.dart';
import 'invoice_screen.dart';

class PaymentHistoryScreen extends StatelessWidget {
  final List<Map<String, String>> paymentHistory = [
    {
      'date': '01 Jan 2025',
      'amount': '\$100',
      'status': 'Paid',
      'dueDate': 'N/A',
    },
    {
      'date': '01 Feb 2025',
      'amount': '\$100',
      'status': 'Due',
      'dueDate': '01 Mar 2025',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment History'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.tealAccent, Colors.teal],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: paymentHistory.length,
          itemBuilder: (context, index) {
            final payment = paymentHistory[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: CircleAvatar(
                  backgroundColor: payment['status'] == 'Paid'
                      ? Colors.green
                      : Colors.redAccent,
                  child: Icon(
                    payment['status'] == 'Paid'
                        ? Icons.check_circle
                        : Icons.error,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  'Date: ${payment['date']}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Amount: ${payment['amount']}'),
                    Text('Status: ${payment['status']}'),
                    if (payment['status'] == 'Due')
                      Text('Due Date: ${payment['dueDate']}'),
                  ],
                ),
                trailing: payment['status'] == 'Paid'
                    ? IconButton(
                  icon: Icon(Icons.download, color: Colors.teal),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InvoiceScreen(
                          paymentDetails: payment,
                        ),
                      ),
                    );
                  },
                )
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
