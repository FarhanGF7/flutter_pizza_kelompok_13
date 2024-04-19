import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_app/components/button2.dart';
import 'package:uts_app/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/shop.dart';
import 'menu_details_page.dart';
import '../components/food_tile.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // navigasi ke food item details
  void navigateToMenuDetails(int index) {
    // shop dan menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MenuDetailsPage(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // shop dan menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        leading: const Icon(
          Icons.menu,
        ),
        title: const Text(
          'Pizza Rizqi',
        ),
        actions: [
          // keranjang button
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cartpage');
            },
            icon: const Icon(Icons.shopping_cart_rounded),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          //promo banner
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //promo message
                    Text(
                      "Dapatkan 17% Promo",
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 20),

                    //redeem button
                    MyButton2(
                      text: "Tukarkan",
                      onTap: () {},
                    )
                  ],
                ),

                //image
                Image.asset(
                  "assets/images/sasami_pizza.png",
                  height: 100,
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Telusuri...",
              ),
            ),
          ),

          const SizedBox(height: 25),

          // list menu
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Menu",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 66, 66, 66),
                fontSize: 18,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
                onTap: () => navigateToMenuDetails(index),
              ),
            ),
          ),

          const SizedBox(height: 25),

          // popular pizza
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // image
                    Image.asset(
                      'assets/images/pizza_mozarella.png',
                      height: 60,
                    ),

                    const SizedBox(width: 20),

                    // nama and harga
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mozarella",
                          style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                        ),

                        const SizedBox(height: 10),

                        // harga
                        const Text(
                          " Rp79.999",
                          style: TextStyle(color: Color.fromARGB(255, 97, 97, 97)),
                        ),
                      ],
                    ),
                  ],
                ),

                // heart
                const Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                  size: 25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
