import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodapp_delivery_exercice_vsa_ep/components/my_button.dart';
import 'package:foodapp_delivery_exercice_vsa_ep/components/my_cart_tile.dart';
import 'package:foodapp_delivery_exercice_vsa_ep/pages/payment_page.dart';
import '../models/restaurant.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      // cart
      final userCart = restaurant.cart;

      // scaffold UI
      return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            // clear cart button
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Are you sure you want to clear the cart ?"),
                    actions: [
                      // cancel button
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                      ),

                      // yes button
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          restaurant.cleanCart();
                        },
                        child: const Text("Yes"),
                      )
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
        body: Column(
          children: [
            // list of cart
            Expanded(
              child: userCart.isEmpty
                  ? const Center(child: Text("Cart is empty..."))
                  : ListView.builder(
                itemCount: userCart.length,
                itemBuilder: (context, index) {
                  final cartItem = userCart[index];

                  // retour avec un MyCartTile et un espace entre chaque élément
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10), // Ajouter de l'espace entre les produits
                    child: MyCartTile(cartItem: cartItem),
                  );
                },
              ),
            ),
            // button to pay
            MyButton(
              text: "Go to checkout",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentPage(),
                ),
              ),
            ),
            const SizedBox(height: 25),
          ],
        ),
      );
    });
  }
}
