import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uts_app/main.dart';

class DescriptionBox extends StatelessWidget {
  const DescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    // textstyle
    var myPrimeTextStyle = TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
    var mySecondaryTextStyle = TextStyle(color: Theme.of(context).colorScheme.primary);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Biaya Ongkir
          Column(
            children: [
              Text(
                'Rp10.000',
                style: myPrimeTextStyle,
              ),
              Text(
                "Biaya Ongkir",
                style: mySecondaryTextStyle,
              ),
            ],
          ),
          // Waktu Pengantaran
          Column(
            children: [
              Text(
                '15-30 menit',
                style: myPrimeTextStyle,
              ),
              Text(
                "Waktu Pengantaran",
                style: mySecondaryTextStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
