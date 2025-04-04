import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodapp_delivery_exercice_vsa_ep/components/my_quantity_selector.dart';
import 'package:foodapp_delivery_exercice_vsa_ep/models/cart_item.dart';
import '../models/restaurant.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
        builder: (context, restaurant, child) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // food image
                 ClipRRect(
                   borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    cartItem.food.imagePath,
                      height: 100,
                      width: 100,
                      ),
                     ),

                  const SizedBox(width: 10),

                  // name and price
                   Padding(
                     padding: const EdgeInsets.only(left: 10.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         // food name
                         Text(cartItem.food.name),

                         // food price
                         Text('\$' + cartItem.food.price.toString(),
                           style: TextStyle(
                               color: Theme.of(context).colorScheme.primary),
                         ),

                         const SizedBox(height: 10),

                         // increment or decrement quantity
                         QuantitySelector(
                           food: cartItem.food,
                           quantity: cartItem.quantity,
                           onDecrement: () {
                             restaurant.removeFromCart(cartItem);
                           },
                           onIncrement: () {
                             restaurant.addToCart(
                                 cartItem.food, cartItem.selectedAddons
                             );
                           },
                         ),
                       ],
                     ),
                   ),
                ],
              ),
            ),
              // addons
              SizedBox(
                height: cartItem.selectedAddons.isEmpty ? 0 : 60, // Cache la ListView si vide
                child: cartItem.selectedAddons.isEmpty
                    ? null // Pas besoin de ListView si la liste est vide
                    : ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                  children: cartItem.selectedAddons.map((addon) => Padding (

                      padding: const EdgeInsets.only(right: 8.0), // Ajoute un espacement entre les chips
                      child: FilterChip(
                        label: Row(
                          mainAxisSize: MainAxisSize.min, // Ajuste la taille du Row pour s'adapter au contenu
                          children: [
                            // Nom de l'addon
                            Text(addon.name),

                            SizedBox(width: 4), // Espacement entre le nom et le prix

                            // Prix de l'addon
                            Text('\$${addon.price.toStringAsFixed(2)}'),
                          ],
                        ),
                        shape: StadiumBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.primary
                          )
                        ),
                        onSelected: (value) {
                          // Ajoute ici une logique si tu veux gérer la sélection du chip
                        },
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 12,
                        ),
                      ),
                    )
                  ).toList(), // Utilise toList() pour éviter les erreurs de type
                ),
              )

            ],
      ),
    ));
  }
}
