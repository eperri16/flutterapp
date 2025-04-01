import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodapp_delivery_exercice_vsa_ep/components/my_drawer_tile.dart';
import 'package:foodapp_delivery_exercice_vsa_ep/pages/login_page.dart';
import 'package:foodapp_delivery_exercice_vsa_ep/services/auth_service.dart';

import '../pages/profile_page.dart';
import '../pages/settings_page.dart';
import '../services/auth/auth_gate.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(){
    final _authService = AuthServices();
    _authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: SvgPicture.asset('lib/images/logos/Go-Miam.svg',
              height: 100, // Remplacez par la taille souhaitée
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          // home list tile
          MyDrawerTile(
              text: "H O M E",
              icon: Icons.home,
              onTap: () => Navigator.pop(context),
          ),

          // profile tile
          MyDrawerTile(
            text: "P R O F I L E",
            icon: Icons.person,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ));
            },
          ),

          // settings list tile
          MyDrawerTile(
              text: "S E T T I N G S",
              icon: Icons.settings,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                ));
              },
          ),

          const Spacer(),

          // logout list tile
          MyDrawerTile(
              text: "L O G  O U T",
              icon: Icons.logout,
            onTap: ()  async {
              // Déconnecter l'utilisateur
              await FirebaseAuth.instance.signOut();

              // Revenir à l'AuthGate (qui décidera entre LoginPage ou HomePage)
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const AuthGate()),
                    (route) => false, // Supprime toutes les pages précédentes de la pile
              );
            },
          ),

          const SizedBox(height: 25),

          //

        ],
      ),
    );
  }
}
