import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Payment {
  final String id;
  final String memberId;
  final String method;
  final double amount;
  final String status;
  final DateTime date;

  Payment({
    required this.id,
    required this.memberId,
    required this.method,
    required this.amount,
    required this.status,
    required this.date,
  });
}

class RecordPaymentScreen extends StatefulWidget {
  @override
  _RecordPaymentScreenState createState() => _RecordPaymentScreenState();
}

class _RecordPaymentScreenState extends State<RecordPaymentScreen> {
  final TextEditingController memberIdController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  String selectedMethod = 'Cash';
  String paymentStatus = 'Pending';

  final List<Payment> payments = [];

  void recordPayment() {
    if (memberIdController.text.isNotEmpty && amountController.text.isNotEmpty) {
      setState(() {
        payments.add(
          Payment(
            id: Uuid().v4(),
            memberId: memberIdController.text,
            method: selectedMethod,
            amount: double.parse(amountController.text),
            status: paymentStatus,
            date: DateTime.now(),
          ),
        );
        memberIdController.clear();
        amountController.clear();
        selectedMethod = 'Cash';
        paymentStatus = 'Pending';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Record Payment',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Record Payment',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade900,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: memberIdController,
              decoration: InputDecoration(
                labelText: 'Member ID',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedMethod,
                    decoration: InputDecoration(
                      labelText: 'Payment Method',
                      border: OutlineInputBorder(),
                    ),
                    items: ['Cash', 'Card', 'Online']
                        .map((method) => DropdownMenuItem(
                      value: method,
                      child: Text(method),
                    ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedMethod = value!;
                      });
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: paymentStatus,
                    decoration: InputDecoration(
                      labelText: 'Payment Status',
                      border: OutlineInputBorder(),
                    ),
                    items: ['Paid', 'Pending']
                        .map((status) => DropdownMenuItem(
                      value: status,
                      child: Text(status),
                    ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        paymentStatus = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: recordPayment,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              child: Text('Record Payment'),
            ),
            SizedBox(height: 20),
            Divider(thickness: 1, color: Colors.grey),
            Text(
              'Payment Records',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade900,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: payments.isEmpty
                  ? Center(
                child: Text(
                  'No payments recorded yet.',
                  style: TextStyle(color: Colors.grey),
                ),
              )
                  : ListView.builder(
                itemCount: payments.length,
                itemBuilder: (context, index) {
                  final payment = payments[index];
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.teal,
                        child: Text(
                          payment.memberId[0].toUpperCase(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text('Member ID: ${payment.memberId}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Amount: \$${payment.amount.toStringAsFixed(2)}'),
                          Text('Method: ${payment.method}'),
                          Text('Status: ${payment.status}'),
                          Text('Date: ${payment.date.toLocal().toString().split(' ')[0]}'),
                        ],
                      ),
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
