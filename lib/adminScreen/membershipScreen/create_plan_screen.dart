import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:gym_management_app/model/membership_plan_model.dart';

class CreatePlanScreen extends StatefulWidget {
  @override
  _CreatePlanScreenState createState() => _CreatePlanScreenState();
}

class _CreatePlanScreenState extends State<CreatePlanScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final List<MembershipPlan> plans = [];

  void createPlan() {
    if (nameController.text.isNotEmpty &&
        durationController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty) {
      setState(() {
        plans.add(
          MembershipPlan(
            id: Uuid().v4(),
            name: nameController.text,
            duration: durationController.text,
            price: double.parse(priceController.text),
            discount: discountController.text.isNotEmpty
                ? double.parse(discountController.text)
                : null,
            description: descriptionController.text,
          ),
        );
        nameController.clear();
        durationController.clear();
        priceController.clear();
        discountController.clear();
        descriptionController.clear();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Plan created successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all required fields!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text('Create Membership Plan'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade700, Colors.purple.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Set up a new membership plan',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Please fill out the details below to create a new plan.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 20),
              _buildInputField(
                controller: nameController,
                label: 'Plan Name',
                hintText: 'Enter the name of the plan',
              ),
              SizedBox(height: 16),
              _buildInputField(
                controller: durationController,
                label: 'Duration',
                hintText: 'e.g., Monthly, Yearly',
              ),
              SizedBox(height: 16),
              _buildInputField(
                controller: priceController,
                label: 'Price',
                hintText: 'Enter the price (e.g., 50)',
                inputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              _buildInputField(
                controller: discountController,
                label: 'Discount',
                hintText: 'Enter discount percentage (Optional)',
                inputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              _buildInputField(
                controller: descriptionController,
                label: 'Description',
                hintText: 'Enter a brief description',
                maxLines: 3,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: createPlan,
                child: Text(
                  'Create Plan',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    String? hintText,
    TextInputType inputType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label,
        hintText: hintText,
        labelStyle: TextStyle(color: Colors.black54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
