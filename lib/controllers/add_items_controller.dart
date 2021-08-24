import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class AddItemsController extends GetxController {
  CollectionReference items = FirebaseFirestore.instance.collection('items');

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

  Future<void> addItem(
      String id, String brand, String name, double price, int quentity) {
    // Call the user's CollectionReference to add a new user
    return items
        .doc(id)
        .set({
          'brand': brand,
          'name': name,
          'price': price,
          'quentity': quentity
        })
        .then((value) => Get.snackbar("Başarılı", "Ürün eklendi.",
            snackPosition: SnackPosition.BOTTOM))
        .catchError((error) => Get.snackbar("Failed to add item", "$error",
            snackPosition: SnackPosition.BOTTOM));
  }

  Future<void> updateItem(
      String id, String brand, String name, double price, int quentity) {
    return items
        .doc(id)
        .update({
          'brand': brand,
          'name': name,
          'price': price,
          'quentity': FieldValue.increment(quentity)
        })
        .then((value) => Get.snackbar("Başarılı", "Ürün güncellendi.",
            snackPosition: SnackPosition.BOTTOM))
        .catchError((error) => Get.snackbar("Failed to add item", "$error",
            snackPosition: SnackPosition.BOTTOM));
  }

  Future<bool> checkDocument(String id) async {
    return items.doc(id).get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print(true);
        return true;
      } else {
        print(false);
        return false;
      }
    });
  }
}
