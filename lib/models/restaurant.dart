import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';

import 'cart_item.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier {
  // daftar menu
  final List<Food> _menu = [
    // pizza
    Food(
      name: "Pizza Margherita",
      description:
          "Pizza Margherita adalah pizza klasik Italia dengan adonan tipis, saus tomat segar, mozzarella meleleh, dan daun basil segar untuk cita rasa yang sederhana namun lezat.",
      imagePath: "assets/images/pizza/pizza_margherita.jpg",
      price: 30000,
      category: FoodCategory.pizza,
      availableAddons: [
        Addon(name: "Extra Pedas", price: 5000),
      ],
    ),
    Food(
      name: "Pizza Mozzarella",
      description:
          "Pizza Mozzarella adalah pizza yang memukau dengan kelezatan keju mozzarella yang meleleh sempurna di atas adonan tipis yang garing. Disajikan dengan saus tomat yang merata dan bumbu-bumbu pilihan, pizza ini menawarkan cita rasa yang klasik dan memuaskan bagi pencinta keju.",
      imagePath: "assets/images/pizza/pizza_mozarella.png",
      price: 30000,
      category: FoodCategory.pizza,
      availableAddons: [
        Addon(name: "Extra Pedas", price: 5000),
      ],
    ),
    Food(
      name: "Sasami Pizza",
      description:
          "Sasami Pizza adalah kombinasi unik dari cita rasa Jepang dan kelezatan pizza klasik, dengan adonan tipis, saus teriyaki, potongan ayam, keju mozzarella, dan taburan nori untuk pengalaman makan yang eksotis dan memuaskan.",
      imagePath: "assets/images/pizza/sasami_pizza.png",
      price: 30000,
      category: FoodCategory.pizza,
      availableAddons: [
        Addon(name: "Extra Manis", price: 5000),
      ],
    ),
    Food(
      name: "Splitza Signature",
      description: "",
      imagePath: "assets/images/pizza/splitza_signature.jpg",
      price: 30000,
      category: FoodCategory.pizza,
      availableAddons: [
        Addon(name: "Extra Manis", price: 5000),
      ],
    ),

    //drinks
    Food(
      name: "Es Teh",
      description: "fsafsa",
      imagePath: "assets/images/drinks/es_teh.png",
      price: 10000,
      category: FoodCategory.drinks,
      availableAddons: [],
    ),
    Food(
      name: "Es Jeruk",
      description: "asdasd",
      imagePath: "assets/images/drinks/es_jeruk.jpg",
      price: 10000,
      category: FoodCategory.drinks,
      availableAddons: [],
    ),

    //sides
    Food(
      name: "Nasi Goreng",
      description: "asd",
      imagePath: "assets/images/sides/nasi_goreng.png",
      price: 10000,
      category: FoodCategory.sides,
      availableAddons: [],
    ),
  ];

  /* 
  GETTER 
  */

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  /* 
  METHODS 
  */

  // user keranjang
  final List<CartItem> _cart = [];

  // menambah pesanan ke keranjang
  void addToCart(Food food, List<Addon> selectedAddons) {
    // cek jika keranjang telah ditambahkan dengan jenis menu yang sama
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // cek jika food item sama
      bool isSameFood = item.food == food;

      // cek jika addons item sama
      bool isSameAddons = const ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });
    // cek keranjang sudah ada atau belum
    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
          quantity: 1,
        ),
      );
    }
  }

  // mengurangi pesanan dari keranjang
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // total biaya pesanan di keranjang
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

  // total banyaknya item di keranjang
  int getTotalItems() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  // mengosongkan keranjang
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /* 
  CONSTRUCTORS 
  */

  // buat struk belanja
}
