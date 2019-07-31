import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';


class Product {
  String id;
  int price;
  String name;
  String img;

  Product(this.id, this.price, this.name,this.img);

  Product.fromMap(Map snapshot,String id) :
        id = id ?? '',
        price = snapshot['price'] ?? 0,
        name = snapshot['name'] ?? '',
        img = snapshot['img'] ?? '';

  toJson() {
    return {
      "price": price,
      "name": name,
      "img": img,
    };
  }
}