import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';


class Product {
  String id;
  double price;
  String name;
  String img;

  Product(this.id, this.price, this.name,this.img);

  Product.fromMap(Map snapshot) :
        id = snapshot['detail'] ?? '',
        price = snapshot['price'] ?? '',
        name = snapshot['name'] ?? '',
        img = snapshot['img'] ?? '';

  toJson() {
    return {
      "id": id,
      "price": price,
      "name": name,
      "img": img,
    };
  }
}