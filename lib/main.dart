import 'package:flutter/material.dart';
// import 'package:gym_management_app/crud.dart';
// import 'package:gym_management_app/sampleScreen/admin_screen.dart';
// import 'package:gym_management_app/screens/log_in.dart';
import 'package:gym_management_app/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Role-Based App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
      // home: LocalCrudScreen(),
    );
  }
}

// Login Screen







