import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxList cartList = [].obs;

  var scannedBarcode = "";

  Future<String?> scanBarcode() async {
    try {
      scannedBarcode = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      return scannedBarcode;
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateItems() async {
    for (var i = 0; i < cartList.length; i++) {
      return _firestore
          .collection(_auth.currentUser!.uid)
          .doc(cartList[i].id)
          .update({'quentity': FieldValue.increment(-cartList[i].quentity)});
    }
  }
}
