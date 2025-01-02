import 'package:flutter/material.dart';
import 'package:gym_management_app/model/equipment_model.dart';

class UpdateEquipmentScreen extends StatefulWidget {
  final Equipment equipment;

  UpdateEquipmentScreen({required this.equipment});

  @override
  _UpdateEquipmentScreenState createState() => _UpdateEquipmentScreenState();
}

class _UpdateEquipmentScreenState extends State<UpdateEquipmentScreen> {
  late TextEditingController nameController;
  late TextEditingController typeController;
  late TextEditingController quantityController;
  late TextEditingController conditionController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.equipment.name);
    typeController = TextEditingController(text: widget.equipment.type);
    quantityController = TextEditingController(text: widget.equipment.quantity.toString());
    conditionController = TextEditingController(text: widget.equipment.condition);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Equipment'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextField(
                      controller: nameController,
                      label: 'Equipment Name',
                      icon: Icons.device_hub,
                    ),
                    _buildTextField(
                      controller: typeController,
                      label: 'Equipment Type',
                      icon: Icons.category,
                    ),
                    _buildTextField(
                      controller: quantityController,
                      label: 'Quantity',
                      icon: Icons.numbers,
                      keyboardType: TextInputType.number,
                    ),
                    _buildTextField(
                      controller: conditionController,
                      label: 'Condition',
                      icon: Icons.check_circle_outline,
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Update the equipment data
                        final updatedEquipment = Equipment(
                          id: widget.equipment.id,
                          name: nameController.text,
                          type: typeController.text,
                          quantity: int.parse(quantityController.text),
                          condition: conditionController.text,
                          purchaseDate: widget.equipment.purchaseDate,
                          nextMaintenanceDate: widget.equipment.nextMaintenanceDate,
                        );
                        // Save the updated equipment data (this can be saved to a database)
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Update Equipment',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.deepPurpleAccent),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 1.5),
          ),
        ),
      ),
    );
  }
}
