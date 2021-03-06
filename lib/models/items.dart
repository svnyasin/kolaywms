import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  String? id;
  String? brand;
  String? name;
  double? price;
  int? quentity;

  Item({this.id, this.brand, this.name, this.price, this.quentity});

  Item.fromMap(DocumentSnapshot data) {
    id = data.id;
    brand = data["brand"];
    name = data["name"];
    price = data["price"];
    quentity = data["quentity"];
  }

  Item copyWith({ String? id,
  String? brand,
  String? name,
  double? price,
  int? quentity, }) {
    return Item(
      id: id ?? this.id,
      brand: brand ?? this.brand,
      name: name ?? this.name,
      price: price ?? this.price,
      quentity: quentity ?? this.quentity,
    );
  }
}
