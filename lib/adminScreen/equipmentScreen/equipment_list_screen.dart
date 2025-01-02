import 'package:flutter/material.dart';
import 'package:gym_management_app/model/equipment_model.dart';
import 'add_equipment_screen.dart';
import 'update_equipment_screen.dart';

class EquipmentListScreen extends StatelessWidget {
  final List<Equipment> equipmentList = [
    Equipment(
      id: '1',
      name: 'Treadmill',
      type: 'Cardio',
      quantity: 5,
      condition: 'Good',
      purchaseDate: DateTime(2022, 10, 1),
      nextMaintenanceDate: DateTime(2024, 10, 1),
    ),
    Equipment(
      id: '2',
      name: 'Dumbbells',
      type: 'Strength Training',
      quantity: 30,
      condition: 'Excellent',
      purchaseDate: DateTime(2021, 5, 15),
      nextMaintenanceDate: DateTime(2023, 5, 15),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equipment Inventory'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: equipmentList.length,
          itemBuilder: (context, index) {
            final equipment = equipmentList[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: Icon(Icons.device_thermostat, size: 40, color: Colors.deepPurpleAccent),
                title: Text(
                  equipment.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Type: ${equipment.type}'),
                    Text('Condition: ${equipment.condition}'),
                    Text('Next Maintenance: ${equipment.nextMaintenanceDate.toLocal().toString().split(' ')[0]}'),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.edit, color: Colors.deepPurpleAccent),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateEquipmentScreen(equipment: equipment),
                      ),
                    );
                  },
                ),
                onTap: () {
                  // Optional: Show more details or navigate to a detail screen
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
            MaterialPageRoute(builder: (context) => AddEquipmentScreen()),
          );
        },
        backgroundColor: Colors.deepPurpleAccent,
        child: Icon(Icons.add),
      ),
    );
  }
}
