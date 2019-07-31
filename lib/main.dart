import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './ui/router.dart';
import './locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './core/models/productModel.dart';
import 'dart:async';
import './core/models/productModel.dart';
import './core/viewmodels/CRUDModel.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => locator<CRUDModel>()),
      ],
      child: MaterialApp(
        title: 'Product App',
        theme: ThemeData(),
        onGenerateRoute: Router.generateRoute,
        home: info(),
      ),
    );
  }
}

class info extends StatefulWidget {
  @override
  _infoState createState() => _infoState();
}

class _infoState extends State<info> {
  List<Product> products;

  @override
  void initState() {
    Map<String, dynamic> data = {"id": "6", "price": 6};
    final Firestore _db = Firestore.instance;
    super.initState();
  }

  Stream<QuerySnapshot> streamData() {
    final Firestore _db = Firestore.instance;
    return _db.collection('products').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<CRUDModel>(context) ;
    return Scaffold(
      body: Container(
          child: StreamBuilder(
            stream: product.fetchProductsAsStream(),
            builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {

                products = snapshot.data.documents
                    .map((doc) => Product.fromMap(doc.data, doc.documentID))
                    .toList();
                print(products[1].toJson());
                return Text('done fetching');
              } else {
                return Text('fetching');
              }
            })
          ),
    );
  }
}
