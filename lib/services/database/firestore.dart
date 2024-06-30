import 'package:cloud_firestore/cloud_firestore.dart';

class FiresetoreService {
  // get koleksi data pemesanan
  final CollectionReference orders = FirebaseFirestore.instance.collection('pesanan');

  // save pesanan ke firebase
  Future<void> saveOrderToDatabase(String receipt) async {
    await orders.add({
      'date': DateTime.now(),
      'pesanan': receipt,
    });
  }
}
