import 'package:flutter/material.dart';
import 'package:gym_management_app/adminScreen/userManagement/add_member_screen.dart';
import 'package:gym_management_app/adminScreen/membershipScreen/membership_plans_dashboard.dart';
import 'package:uuid/uuid.dart';
import 'package:gym_management_app/screens/log_in.dart';

import 'model.dart';
import 'view_member.dart';

class adminScreen extends StatefulWidget {
  @override
  _adminScreenState createState() => _adminScreenState();
}

class _adminScreenState extends State<adminScreen> {
  final List<Member> members = [];
  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';
  String searchFilter = 'Name'; // Default filter

  void addMember(String name, String plan) {
    setState(() {
      members.add(Member(id: Uuid().v4(), name: name, membershipPlan: plan));
    });
  }

  void deleteMember(String id) {
    setState(() {
      members.removeWhere((member) => member.id == id);
    });
  }

  void updateMember(String id, String newName, String newPlan) {
    setState(() {
      final index = members.indexWhere((member) => member.id == id);
      if (index != -1) {
        members[index].name = newName;
        members[index].membershipPlan = newPlan;
      }
    });
  }

  List<Member> get filteredMembers {
    if (searchQuery.isEmpty) {
      return members;
    } else {
      return members.where((member) {
        if (searchFilter == 'Name') {
          return member.name.toLowerCase().contains(searchQuery);
        } else if (searchFilter == 'Plan') {
          return member.membershipPlan.toLowerCase().contains(searchQuery);
        }
        return false;
      }).toList();
    }
  }

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        searchQuery = searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Gym Members', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          DropdownButton<String>(
            value: searchFilter,
            dropdownColor: Colors.white,
            style: TextStyle(color: Colors.black, fontSize: 16),
            onChanged: (value) {
              setState(() {
                searchFilter = value!;
              });
            },
            items: ['Name', 'Plan'].map<DropdownMenuItem<String>>((String filter) {
              return DropdownMenuItem<String>(
                value: filter,
                child: Text(filter),
              );
            }).toList(),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            icon: Icon(Icons.logout),
          ),
          // InkWell(
          //   onTap: (){
          //
          //   },child: Text(),
          // ),

        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search members...',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: filteredMembers.isEmpty
          ? Center(
        child: Text(
          'No members found.',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      )
          : ViewMembersScreen(
        members: filteredMembers,
        deleteMember: deleteMember,
        updateMember: updateMember,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateMemberScreen(
                addMember: addMember,
              ),
            ),
          );
        },
      ),
    );
  }
}
