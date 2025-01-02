import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
// import 'package:share/share.dart';

class GenerateInvoiceScreen extends StatefulWidget {
  @override
  _GenerateInvoiceScreenState createState() => _GenerateInvoiceScreenState();
}

class _GenerateInvoiceScreenState extends State<GenerateInvoiceScreen> {
  final TextEditingController memberIdController = TextEditingController();
  final TextEditingController memberNameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  bool isGenerating = false;

  Future<void> _generateInvoice() async {
    if (memberIdController.text.isEmpty ||
        memberNameController.text.isEmpty ||
        amountController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields.')),
      );
      return;
    }

    setState(() {
      isGenerating = true;
    });

    try {
      final pdf = pw.Document();
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'Invoice',
                  style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
                ),
                pw.SizedBox(height: 20),
                pw.Text('Member ID: ${memberIdController.text}'),
                pw.Text('Member Name: ${memberNameController.text}'),
                pw.Text('Amount: \$${amountController.text}'),
                pw.Text('Date: ${DateTime.now().toLocal().toString().split(' ')[0]}'),
                pw.SizedBox(height: 20),
                pw.Text('Thank you for your payment!'),
              ],
            );
          },
        ),
      );

      final output = await getTemporaryDirectory();
      final file = File("${output.path}/invoice.pdf");
      await file.writeAsBytes(await pdf.save());

      // Share the PDF
      // Share.shareFiles([file.path], text: 'Invoice PDF');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to generate invoice. Please try again.')),
      );
    } finally {
      setState(() {
        isGenerating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate Invoice'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Generate Invoice',
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
              controller: memberNameController,
              decoration: InputDecoration(
                labelText: 'Member Name',
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
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: isGenerating ? null : _generateInvoice,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              icon: Icon(Icons.picture_as_pdf),
              label: Text(isGenerating ? 'Generating...' : 'Generate Invoice'),
            ),
          ],
        ),
      ),
    );
  }
}
