import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts_app/components/button.dart';

import '../theme/colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25),

            // shop name
            Text(
              "PIZZA RIZQI",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 25),

            //title
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset(
                'assets/images/pizza.png',
              ),
            ),

            const SizedBox(height: 25),

            // title
            Text(
              "AUTHENTIC ITALIAN PIZZA",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 44,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Rasakan Masakan Italia dengan rasa asli nan original",
              style: TextStyle(
                color: Color.fromARGB(255, 224, 224, 224),
                height: 2,
              ),
            ),

            const SizedBox(height: 25),

            MyButton(
              text: "Mulai",
              onTap: () {
                Navigator.pushNamed(context, '/menupage');
              },
            )
          ],
        ),
      ),
    );
  }
}
