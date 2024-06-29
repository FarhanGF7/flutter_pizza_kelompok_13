import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_app/components/button.dart';

import '../models/food.dart';
import '../models/shop.dart';
import '../themes/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // hapus salah satu barang dari keranjang
  void removeFromCart(Food food, BuildContext context) {
    final shop = context.read<Shop>();

    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: const Text("Keranjang"),
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: primaryColor,
        ),
        body: Column(
          children: [
            // keranjang konsumen
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  final Food food = value.cart[index];

                  final String foodName = food.nama;

                  final String foodPrice = food.harga;

                  return Container(
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: ListTile(
                      title: Text(
                        foodName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        foodPrice,
                        style: TextStyle(
                          color: Colors.grey[200],
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete_outline_rounded,
                          color: Colors.grey[300],
                        ),
                        onPressed: () => removeFromCart(food, context),
                      ),
                    ),
                  );
                },
              ),
            ),

            // bayar button
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(
                text: "Bayar",
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
