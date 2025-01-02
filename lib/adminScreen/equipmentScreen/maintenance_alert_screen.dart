import 'package:flutter/material.dart';
import 'package:gym_management_app/model/equipment_model.dart';

class MaintenanceAlertsScreen extends StatelessWidget {
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
      appBar: AppBar(title: Text('Maintenance Alerts')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: equipmentList.length,
          itemBuilder: (context, index) {
            final equipment = equipmentList[index];
            final nextMaintenanceDate = equipment.nextMaintenanceDate;
            final isOverdue = nextMaintenanceDate.isBefore(DateTime.now());
            final statusColor = isOverdue ? Colors.red : Colors.green;

            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: Icon(
                  Icons.device_hub,
                  color: statusColor,
                  size: 40,
                ),
                title: Text(equipment.name),
                subtitle: Text('Next Maintenance: ${nextMaintenanceDate.toLocal()}'),
                trailing: isOverdue
                    ? IconButton(
                  icon: Icon(Icons.check_circle, color: Colors.green),
                  onPressed: () {
                    // Add your "Mark as Done" functionality here
                  },
                )
                    : null,
                tileColor: isOverdue ? Colors.red[50] : Colors.green[50],
              ),
            );
          },
        ),
      ),
    );
  }
}
