import 'package:flutter/material.dart';

class RoleManagementScreen extends StatefulWidget {
  @override
  _RoleManagementScreenState createState() => _RoleManagementScreenState();
}

class _RoleManagementScreenState extends State<RoleManagementScreen> {
  List<String> roles = ['Super Admin', 'Receptionist', 'Trainer'];
  String selectedRole = 'Super Admin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Role Management'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Dropdown to select a role
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: DropdownButton<String>(
                value: selectedRole,
                onChanged: (value) {
                  setState(() {
                    selectedRole = value!;
                  });
                },
                isExpanded: true, // Makes dropdown fill the width
                underline: SizedBox(), // Removes default underline
                items: roles
                    .map((role) => DropdownMenuItem(
                  value: role,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(role),
                  ),
                ))
                    .toList(),
                icon: Icon(Icons.arrow_drop_down, color: Colors.deepPurple),
              ),
            ),
            SizedBox(height: 30),

            // Elevated button to assign role
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Role assigned: $selectedRole')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple, // Button color
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Assign Role',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
