import 'package:flutter/cupertino.dart';

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

  /* 
  METHODS 
  */

  // menambah pesanan ke keranjang

  // mengurangi pesanan dari keranjang

  // total biaya pesanan di keranjang

  // total banyaknya item di keranjang

  // mengosongkan keranjang

  /* 
  CONSTRUCTORS 
  */

  // buat struk belanja
}
