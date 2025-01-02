import 'package:flutter/material.dart';

class InvoiceScreen extends StatelessWidget {
  final Map<String, String> paymentDetails;

  InvoiceScreen({required this.paymentDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.tealAccent, Colors.teal],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Invoice',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Divider(),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Date:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(paymentDetails['date']!),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Amount:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(paymentDetails['amount']!),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Status:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      paymentDetails['status']!,
                      style: TextStyle(
                        color: paymentDetails['status'] == 'Paid'
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Divider(),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Invoice downloaded successfully!')),
                    );
                  },
                  icon: Icon(Icons.download),
                  label: Text('Download Invoice'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
