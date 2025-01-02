import 'package:flutter/material.dart';
import 'package:gym_management_app/model/equipment_model.dart';

class AddEquipmentScreen extends StatefulWidget {
  @override
  _AddEquipmentScreenState createState() => _AddEquipmentScreenState();
}

class _AddEquipmentScreenState extends State<AddEquipmentScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController conditionController = TextEditingController();

  DateTime purchaseDate = DateTime.now();
  DateTime nextMaintenanceDate = DateTime.now().add(Duration(days: 30));

  Future<void> selectPurchaseDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: purchaseDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != purchaseDate)
      setState(() {
        purchaseDate = picked;
      });
  }

  Future<void> selectMaintenanceDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: nextMaintenanceDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != nextMaintenanceDate)
      setState(() {
        nextMaintenanceDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Equipment'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade300, Colors.deepPurpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Text
                Center(
                  child: Icon(
                    Icons.fitness_center,
                    size: 100,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Equipment Details',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),

                // Name TextField
                _buildTextField(nameController, 'Equipment Name', Icons.laptop),
                SizedBox(height: 16),

                // Type TextField
                _buildTextField(typeController, 'Equipment Type', Icons.category),
                SizedBox(height: 16),

                // Quantity TextField
                _buildTextField(quantityController, 'Quantity', Icons.add_shopping_cart,
                    keyboardType: TextInputType.number),
                SizedBox(height: 16),

                // Condition TextField
                _buildTextField(conditionController, 'Condition', Icons.new_releases),
                SizedBox(height: 16),

                // Purchase Date
                _buildDateField(
                  context,
                  'Purchase Date',
                  purchaseDate,
                      () => selectPurchaseDate(context),
                ),
                SizedBox(height: 16),

                // Maintenance Date
                _buildDateField(
                  context,
                  'Next Maintenance Date',
                  nextMaintenanceDate,
                      () => selectMaintenanceDate(context),
                ),
                SizedBox(height: 30),

                // Submit Button
                _buildSubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon,
      {TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildDateField(BuildContext context, String label, DateTime selectedDate, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$label: ${selectedDate.toLocal()}'.split(' ')[0],
              style: TextStyle(color: Colors.white),
            ),
            Icon(Icons.calendar_today, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        final newEquipment = Equipment(
          id: DateTime.now().toString(),
          name: nameController.text,
          type: typeController.text,
          quantity: int.parse(quantityController.text),
          condition: conditionController.text,
          purchaseDate: purchaseDate,
          nextMaintenanceDate: nextMaintenanceDate,
        );
        // Add the equipment to the list or database
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurpleAccent,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 32),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        'Add Equipment',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
