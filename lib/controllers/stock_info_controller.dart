import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kolay_wms_mobile/models/items.dart';

class StockInfoController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxList itemsList = [].obs;

  @override
  void onInit() {
    super.onInit();
  }

  Stream<List<Item>> getItems() => _firestore
      .collection(_auth.currentUser!.uid)
      .snapshots()
      .map((query) => query.docs.map((item) => Item.fromMap(item)).toList());

  Future<void> deleteItem(String id) {
    return _firestore
        .collection(_auth.currentUser!.uid)
        .doc(id)
        .delete()
        .then((value) => print("Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }
}
