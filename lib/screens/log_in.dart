import 'package:flutter/material.dart';
import 'package:gym_management_app/User%20Panel/user_home.dart';
import 'package:gym_management_app/adminScreen/admin_panel.dart';
import 'package:gym_management_app/adminScreen/userManagement/admin_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? emailError;
  String? passwordError;

  void validateAndLogin() {
    setState(() {
      emailError = null;
      passwordError = null;

      final email = emailController.text.trim();
      final password = passwordController.text;

      // Email validation
      if (email.isEmpty) {
        emailError = 'Please enter an email';
      } else {
        String pattern = r'^[a-zA-Z0-9._%+-]+@gmail\.com$';
        RegExp regex = RegExp(pattern);
        if (!regex.hasMatch(email)) {
          emailError = 'Please enter a valid Gmail address';
        }
      }

      // Password validation
      if (password.isEmpty) {
        passwordError = 'Please enter a password';
      } else if (password.length < 6) {
        passwordError = 'Password must be at least 6 characters';
      }

      // Navigate if no errors
      if (emailError == null && passwordError == null) {
        final username = email.toLowerCase();
        if (username == 'admin@gmail.com') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => AdminPanel()),
          );
        } else if (username == 'user@gmail.com') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => UserPanel()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Wrong email! Please try again.'),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // App Title
                  Text(
                    'Gym Management App',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Login Card
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          // Email TextField
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              errorText: emailError,
                            ),
                          ),
                          SizedBox(height: 10),
                          // Password TextField
                          TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              errorText: passwordError,
                            ),
                          ),
                          SizedBox(height: 20),
                          // Login Button
                          ElevatedButton(
                            onPressed: validateAndLogin,
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: Colors.orange,
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
