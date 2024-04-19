import 'package:flutter/material.dart';
import 'food.dart';

class Shop extends ChangeNotifier {
  // menu
  final List<Food> _foodMenu = [
    // pizza margherita
    Food(
      nama: "Margherita",
      harga: "Rp 50.000",
      imagePath: "assets/images/pizza_margherita.jpg",
      rating: "4.5",
    ),

    // pizza Splitza Signature
    Food(
      nama: "Splitza Signature",
      harga: "Rp 75.000",
      imagePath: "assets/images/splitza_signature.jpg",
      rating: "4.5",
    ),
  ];

  // customer cart
  // ignore: prefer_final_fields
  List<Food> _cart = [];

  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // tambah keranjang
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // kurangi keranjang
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
