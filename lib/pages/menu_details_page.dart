import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uts_app/components/button2.dart';
import 'package:uts_app/theme/colors.dart';

import '../models/food.dart';
import '../models/shop.dart';

class MenuDetailsPage extends StatefulWidget {
  final Food food;

  const MenuDetailsPage({
    super.key,
    required this.food,
  });

  @override
  State<MenuDetailsPage> createState() => _MenuDetailsPageState();
}

class _MenuDetailsPageState extends State<MenuDetailsPage> {
  // kuantitas
  int quantityCount = 0;

  // decre kuantitas
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  // incre kuantitas
  void incrementQuantity() {
    setState(() {
      setState(() {
        quantityCount++;
      });
    });
  }

  // tambah keranjang
  void addToCart() {
    if (quantityCount > 0) {
      // get access
      final shop = context.read<Shop>();

      // tambah keranjang
      shop.addToCart(widget.food, quantityCount);

      // pesan sukses
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: const Text(
            "Berhasil menambahkan keranjang",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          actions: [
            // okay button
            IconButton(
              onPressed: () {
                // pop once to remove dialog box
                Navigator.pop(context);

                // pop again to go previous screen
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.done,
                color: Colors.white,
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          // listview of food details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  // image
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),

                  const SizedBox(height: 25),

                  // rating
                  Row(
                    children: [
                      // star icon
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),

                      const SizedBox(width: 5),

                      // rating
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // food name
                  Text(
                    widget.food.nama,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 25),
                  ),

                  const SizedBox(height: 25),

                  // description
                  Text(
                    "Deskripsi",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    "Pizza Margherita adalah jenis pizza yang berasal dari Naples, Italia. Pizza ini memiliki bentuk bulat dengan pinggiran yang agak terangkat yang disebut ${"cornicione"}. Toppingnya terdiri dari tomat kupas yang dihancurkan secara kasar, keju mozzarella yang bisa berupa buffalo mozzarella atau fior di latte, daun kemangi segar, dan ditutupi dengan sedikit minyak zaitun.",
                    style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 117),
                      fontSize: 14,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // price + quantity + add to cart button
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                // harga + kuantiti
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //price
                    Text(
                      widget.food.harga,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    // kuantitas
                    Row(
                      children: [
                        // decre button
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: decrementQuantity,
                          ),
                        ),

                        // kuantitas count
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),

                        // incre button
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: incrementQuantity,
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                const SizedBox(height: 15),

                // tambah ke keranjang button
                MyButton2(text: "Tambah Keranjang", onTap: addToCart),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
