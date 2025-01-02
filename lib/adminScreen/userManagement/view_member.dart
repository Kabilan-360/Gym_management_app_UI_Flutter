import 'package:flutter/material.dart';

import 'model.dart';
// import '../models/member_model.dart';

class ViewMembersScreen extends StatelessWidget {
  final List<Member> members;
  final Function(String) deleteMember;
  final Function(String, String, String) updateMember;

  ViewMembersScreen({
    required this.members,
    required this.deleteMember,
    required this.updateMember,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: members.length,
      itemBuilder: (context, index) {
        final member = members[index];
        return ListTile(
          title: Text(member.name),
          subtitle: Text('Plan: ${member.membershipPlan}'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Edit button
              IconButton(
                icon: Icon(Icons.edit, color: Colors.blue),
                onPressed: () {
                  final nameController = TextEditingController(text: member.name);
                  final planController = TextEditingController(text: member.membershipPlan);

                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text('Update Member'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Member name input
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(labelText: 'Member Name'),
                          ),
                          // Membership plan input
                          TextField(
                            controller: planController,
                            decoration: InputDecoration(labelText: 'Membership Plan'),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Update the member when the user submits the form
                            updateMember(
                                member.id,
                                nameController.text,
                                planController.text
                            );
                            Navigator.pop(context);
                          },
                          child: Text('Update'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Close the dialog without saving changes
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        ),
                      ],
                    ),
                  );
                },
              ),
              // Delete button
              IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  deleteMember(member.id);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
