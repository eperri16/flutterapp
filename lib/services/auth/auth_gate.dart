import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp_delivery_exercice_vsa_ep/pages/home_page.dart';
import 'package:foodapp_delivery_exercice_vsa_ep/services/auth/login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    print("AuthGate is being built...");
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            print("Auth state changed: ${snapshot.hasData}");
            // user is logged in
            if (snapshot.hasData){
              return const HomePage();
            }
            //user is NOT logged in
            else {
              print("Showing LoginOrRegister");
              return const LoginOrRegister();
            }
          },
      ),
    );
  }
}






