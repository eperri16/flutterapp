import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodapp_delivery_exercice_vsa_ep/components/my_button.dart';
import 'package:foodapp_delivery_exercice_vsa_ep/components/my_textfield.dart';
import 'package:foodapp_delivery_exercice_vsa_ep/services/auth_service.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  // login method
  void login() async {
    //get instance of auth service
    final _authService = AuthServices();

    //try sign in
    try {
      await _authService.signInWithEmailPassword(emailController.text, passwordController.text);

      // Si la connexion réussit, rediriger vers la page d'accueil
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()), // Remplacez HomePage() par la page d'accueil de votre application
      );
    }

    //display any errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  // forgot password
  void forgotPw() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text("User tapped forgot password."),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
            child: Center(
                child : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // logo
                      SvgPicture.asset(
                        'lib/images/logos/Go-Miam-2.svg',
                        height: 200, // Remplacez par la taille souhaitée
                      ),

                      // message, app slogan
                      Text(
                        "My Favorite Food Delivery App",
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),

                      const SizedBox(height:25),

                      // email textfield
                      MyTextField(
                        controller: emailController,
                        hintText: "Email",
                        obscureText: false,
                      ),

                      const SizedBox(height:10),

                      // password textfield
                      MyTextField(
                        controller: passwordController,
                        hintText: "Password",
                        obscureText: true,
                      ),

                      const SizedBox(height:20),

                      // sign in button
                      MyButton(
                        text: "Sign In",
                        onTap: login,
                      ),


                      const SizedBox(height:25),

                      // not a member ? Register now
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Not a member ?",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                          const SizedBox(width:4),
                          GestureDetector(
                            onTap: () {
                              print("Clique showLoginPage");
                              widget.onTap?.call();  // Appeler la fonction de basculement pour afficher RegisterPage
                            },
                            child: Text(
                              "Register now",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.inversePrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      )



                    ],
                  ),
                ))
        ));
  }
}