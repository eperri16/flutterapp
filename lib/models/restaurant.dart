import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodapp_delivery_exercice_vsa_ep/models/cart_item.dart';
import 'package:foodapp_delivery_exercice_vsa_ep/models/food.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier{

  // list of food menu
  final List<Food> _menu = [

    // burgers
    Food(
    name: "Avocado Burger",
    description: "A delicious burger with fresh avocado slices, lettuce, and a creamy ranch sauce.",
    imagePath: "lib/images/burgers/avocado-burger.jpg",
    price: 8.99,
    category: FoodCategory.burgers,
    availableAddons: [
      Addon(name: "Extra Avocado", price: 1.50),
      Addon(name: "Cheese Slice", price: 1.00),
    ],
  ),
    Food(
      name: "Cheeseburger",
      description: "A classic burger with melted cheddar cheese, fresh lettuce, and tomato.",
      imagePath: "lib/images/burgers/cheese-burger.jpg",
      price: 7.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Bacon", price: 1.50),
        Addon(name: "Extra Cheese", price: 1.00),
      ],
    ),
    Food(
      name: "Spicy Burger",
      description: "A fiery burger with jalapeños, spicy sauce, and Pepper Jack cheese.",
      imagePath: "lib/images/burgers/spicy-burger.jpg",
      price: 8.49,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Jalapeños", price: 1.00),
        Addon(name: "Spicy Mayo", price: 0.50),
      ],
    ),
    Food(
      name: "Vegetarian Burger",
      description: "A plant-based burger with a veggie patty, fresh greens, and vegan mayo.",
      imagePath: "lib/images/burgers/vegetarian-burger.jpg",
      price: 8.29,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Avocado", price: 1.50),
        Addon(name: "Vegan Cheese", price: 1.20),
      ],
    ),
    Food(
      name: "Chicken Burger",
      description: "A crispy chicken burger with lettuce, pickles, and a tangy mayo sauce.",
      imagePath: "lib/images/burgers/chicken-burger.jpg",
      price: 8.79,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Chicken Patty", price: 2.50),
        Addon(name: "Cheese Slice", price: 1.00),
      ],
    ),

    // salads
    Food(
     name: "Caesar Salad",
     description: "A classic salad with romaine lettuce, croutons, parmesan, and Caesar dressing.",
     imagePath: "lib/images/salads/cesar-salad.jpg",
     price: 7.99,
     category: FoodCategory.salads,
     availableAddons: [
       Addon(name: "Grilled Chicken", price: 2.50),
       Addon(name: "Extra Parmesan", price: 1.00),
     ],
   ),
    Food(
      name: "Quinoa Salad",
      description: "A fresh salad with quinoa, avocado, cherry tomatoes, and a lemon vinaigrette.",
      imagePath: "lib/images/salads/quinoa-salad.jpg",
      price: 8.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra Avocado", price: 1.50),
        Addon(name: "Feta Cheese", price: 1.20),
      ],
    ),
    Food(
      name: "Thai Salad",
      description: "A spicy salad with shredded carrots, red cabbage, peanuts, and a tangy dressing.",
      imagePath: "lib/images/salads/thai-salad.jpg",
      price: 8.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Shrimp", price: 3.00),
        Addon(name: "Extra Peanuts", price: 0.50),
      ],
    ),
    Food(
      name: "Pasta Salad",
      description: "A hearty salad with pasta, cherry tomatoes, cucumbers, and Italian dressing.",
      imagePath: "lib/images/salads/pasta-salad.jpg",
      price: 7.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 2.50),
        Addon(name: "Parmesan", price: 1.00),
      ],
    ),
    Food(
      name: "Greek Salad",
      description: "A Mediterranean salad with cucumbers, tomatoes, olives, feta cheese, and olive oil.",
      imagePath: "lib/images/salads/greek-salad.jpg",
      price: 7.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra Feta Cheese", price: 1.50),
        Addon(name: "Pita Bread", price: 2.00),
      ],
    ),

    // desserts
    Food(
      name: "Apple Pie",
      description: "A warm apple pie served with cinnamon and caramel sauce.",
      imagePath: "lib/images/desserts/apple-dessert.jpg",
      price: 4.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Vanilla Ice Cream", price: 1.50),
        Addon(name: "Extra Caramel Sauce", price: 0.75),
      ],
    ),
    Food(
      name: "Chocolate Muffin",
      description: "A rich chocolate muffin topped with melted chocolate.",
      imagePath: "lib/images/desserts/chocolate-dessert.jpg",
      price: 5.49,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Whipped Cream", price: 0.50),
        Addon(name: "Extra Chocolate Sauce", price: 0.75),
      ],
    ),
    Food(
      name: "Tiramisu",
      description: "A classic Italian dessert with mascarpone and coffee flavors.",
      imagePath: "lib/images/desserts/tiramisu-dessert.jpg",
      price: 5.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra Coffee Syrup", price: 0.50),
        Addon(name: "Cocoa Powder", price: 0.30),
      ],
    ),
    Food(
      name: "Raspberry Dessert",
      description: "A creamy cheesecake with a raspberry swirl topping.",
      imagePath: "lib/images/desserts/raspberry-dessert.jpg",
      price: 4.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Fresh Raspberries", price: 1.00),
        Addon(name: "Raspberry Sauce", price: 0.75),
      ],
    ),
    Food(
        name: "Lemon Sorbet",
      description: "A tangy lemon sorbet topped with powdered sugar and lemon juice.",
      imagePath: "lib/images/desserts/lemonsorbert-dessert.jpg",
      price: 4.79,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Whipped Cream", price: 0.50),
        Addon(name: "Candied Lemon Peel", price: 0.75),
      ],
    ),

    // drinks
    Food(
      name: "7up",
      description: "A refreshing lemon-lime soda to quench your thirst.",
      imagePath: "lib/images/drinks/7up-drink.jpg",
      price: 2.49,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Ice", price: 0.30),
        Addon(name: "Lemon Slice", price: 0.20),
      ],
    ),
    Food(
      name: "Coke",
      description: "The classic cola flavor that everyone loves.",
      imagePath: "lib/images/drinks/coke-drink.jpg",
      price: 2.59,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Ice", price: 0.30),
        Addon(name: "Cherry Syrup", price: 0.50),
      ],
    ),
    Food(
      name: "Fanta",
      description: "A bubbly orange soda with a fruity twist.",
      imagePath: "lib/images/drinks/fanta-drink.jpg",
      price: 2.49,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Ice", price: 0.30),
        Addon(name: "Orange Slice", price: 0.20),
      ],
    ),
    Food(
      name: "Ice Tea",
      description: "A chilled, sweetened tea perfect for hot days.",
      imagePath: "lib/images/drinks/icetea-drink.jpg",
      price: 2.79,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Lemon Slice", price: 0.20),
        Addon(name: "Honey", price: 0.40),
      ],
    ),
    Food(
      name: "Tropicana",
      description: "A 100% pure orange juice, packed with vitamins.",
      imagePath: "lib/images/drinks/tropicana-drink.webp",
      price: 3.29,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Ice Cubes", price: 0.30),
        Addon(name: "Mint Leaves", price: 0.25),
      ],
    ),

    // sides
    Food(
       name: "Chips",
       description: "Crunchy salted potato chips, perfect for snacking.",
       imagePath: "lib/images/sides/chips-side.jpg",
       price: 1.99,
       category: FoodCategory.sides,
       availableAddons: [
          Addon(name: "Extra Salt", price: 0.20),
          Addon(name: "Cheese Dip", price: 0.50),
      ],
  ),
    Food(
      name: "Doritos",
      description: "Cheesy and flavorful tortilla chips.",
      imagePath: "lib/images/sides/doritos-side.jpg",
      price: 2.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Spicy Salsa", price: 0.75),
        Addon(name: "Guacamole", price: 1.00),
      ],
  ),
    Food(
      name: "Pasta",
      description: "A small side of pasta with a creamy Alfredo or tomato sauce.",
      imagePath: "lib/images/sides/pasta-side.jpg",
      price: 3.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra Sauce", price: 0.50),
        Addon(name: "Parmesan Cheese", price: 1.00),
      ],
  ),
    Food(
      name: "French Fries",
      description: "Golden crispy fries, served hot and salted.",
      imagePath: "lib/images/sides/frenchfries-side.jpg",
      price: 2.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese Sauce", price: 0.75),
        Addon(name: "Ketchup", price: 0.25),
      ],
  ),
    Food(
      name: "Potatoes",
      description: "Roasted potato wedges with a hint of herbs and spices.",
      imagePath: "lib/images/sides/potatoes-side.jpg",
      price: 3.29,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Garlic Butter", price: 0.50),
        Addon(name: "Sour Cream", price: 0.75),
      ],
    ),
  ];

  // user cart
  final List<CartItem> _cart = [];

  // delivery address (which user can change/update)
  List<Food> get menu => _menu;
  String _deliveryAddress = "";

  List<CartItem> get cart => List.unmodifiable(_cart);
  String get deliveryAddress => _deliveryAddress;

  void addToCart(Food food, List<Addon> selectedAddons) {
    var cartItem = _cart.firstWhereOrNull((item) =>
        item.food == food &&
        ListEquality().equals(item.selectedAddons, selectedAddons));

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons, quantity: 1));
    }
    notifyListeners();
  }

  // get total price of cart
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  // get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  void cleanCart() {
    _cart.clear();
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    var existingItem = _cart.firstWhereOrNull((item) => item == cartItem);

    if (existingItem != null) {
      if (existingItem.quantity > 1) {
        existingItem.quantity--;
      } else {
        _cart.remove(existingItem);
      }
      notifyListeners();
    }
  }

  void updateDeliveryAddress(String newAddress) {
    if (newAddress.isNotEmpty) {
      _deliveryAddress = newAddress;
      notifyListeners();
    }
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /*

  H E L P E R S

  */

  // generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    // format the date to include up to seconds only
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("----------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}"
      );
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("   Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("----------");
    receipt.writeln();
    receipt.writeln("Total Items : ${getTotalItemCount()}");
    receipt.writeln("Total Price : ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to : $deliveryAddress");

    return receipt.toString();
  }




  // format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  // format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons.map((addon) => "${addon.name} (${_formatPrice(addon.price)})").join(", ");
  }}