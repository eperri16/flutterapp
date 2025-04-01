import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodapp_delivery_exercice_vsa_ep/services/auth_service.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback onTap; // Changed to VoidCallback for direct callback function type

  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Text editing controllers for email, password, and confirm password
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void register() async {
    final _authService = AuthServices();

    // Check if passwords match
    if (passwordController.text == confirmPasswordController.text) {
      try {
        // Try creating the user
        await _authService.signUpWithEmailPassword(
          emailController.text,
          passwordController.text,
        );

        // Check if the widget is still mounted before doing anything with context
        if (mounted) {
          // Optionally, you can navigate to the login page here
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      } catch (e) {
        // Display any errors during registration
        if (mounted) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(e.toString()),
            ),
          );
        }
      }
    } else {
      // If passwords don't match, show an error
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Passwords don't match!"),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo or icon at the top
                SvgPicture.asset(
                  'lib/images/logos/Go-Miam-2.svg',
                  height: 200, // Remplacez par la taille souhaitée
                ),

                // Message or slogan for registration
                Text(
                  "Let's create an account for you",
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(height: 25),

                // Email text field
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),
                const SizedBox(height: 10),

                // Password text field
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
                const SizedBox(height: 10),

                // Confirm password text field
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  obscureText: true,
                ),
                const SizedBox(height: 20),

                // Sign up button
                MyButton(
                  text: "Sign Up",
                  onTap: register,
                ),
                const SizedBox(height: 25),

                // Row for already have an account link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account ?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap, // Call the onTap callback passed in the constructor
                      child: Text(
                        "Login now",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
