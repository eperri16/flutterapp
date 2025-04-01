import 'package:flutter/material.dart';
import 'package:foodapp_delivery_exercice_vsa_ep/pages/login_page.dart';
import 'package:foodapp_delivery_exercice_vsa_ep/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  // Initially, show login page
  bool showLoginPage = true;

  // Toggle between login and register page
  void togglePages() {
    if (mounted) {
      setState(() {
        showLoginPage = !showLoginPage;
      });
      print("Toggled to: ${showLoginPage ? 'Login' : 'Register'}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showLoginPage
          ? LoginPage(onTap: togglePages)
          : RegisterPage(onTap: togglePages),
    );
  }
}
