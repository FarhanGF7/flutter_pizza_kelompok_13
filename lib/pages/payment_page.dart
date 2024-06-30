import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:uts_app/components/button.dart';
import 'package:uts_app/pages/delivery_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String nomorKartu = '';
  String tglKadaluarsa = '';
  String namaPemegangKartu = '';
  String kodeCvv = '';
  bool isCvvFocused = false;

  // user klik tombol bayar
  void bayar() {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Konfirmasi Pembayaran"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Nomor Kartu: $nomorKartu"),
                Text("Tanggal Kadaluarsa: $tglKadaluarsa"),
                Text("Nama Pemegang Kartu: $namaPemegangKartu"),
                Text("Nomor Kartu: $kodeCvv"),
              ],
            ),
          ),
          actions: [
            // tombol batal
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal"),
            ),

            // tombol ya
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DeliveryPage(),
                  ),
                );
              },
              child: const Text("Ya"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Bayar Sekarang"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              // kartu kredit/debit
              CreditCardWidget(
                cardNumber: nomorKartu,
                expiryDate: tglKadaluarsa,
                cardHolderName: namaPemegangKartu,
                cvvCode: kodeCvv,
                showBackView: isCvvFocused,
                onCreditCardWidgetChange: (p0) {},
              ),

              // kartu kredit/debit form
              CreditCardForm(
                cardNumber: nomorKartu,
                expiryDate: tglKadaluarsa,
                cardHolderName: namaPemegangKartu,
                cvvCode: kodeCvv,
                onCreditCardModelChange: (data) {
                  setState(() {
                    nomorKartu = data.cardNumber;
                    tglKadaluarsa = data.expiryDate;
                    namaPemegangKartu = data.cardHolderName;
                    kodeCvv = data.cvvCode;
                    isCvvFocused = data.isCvvFocused;
                  });
                },
                formKey: formKey,
              ),

              const SizedBox(height: 25),

              MyButton(
                text: "Bayar Sekarang",
                onTap: bayar,
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
