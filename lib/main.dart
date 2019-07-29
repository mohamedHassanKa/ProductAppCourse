import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './ui/router.dart';
import './locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './core/models/productModel.dart';
import 'dart:async';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Product App',
      theme: ThemeData(),
      onGenerateRoute: Router.generateRoute,
      home: info(),
    );
  }
}
class info extends StatefulWidget {
  @override
  _infoState createState() => _infoState();
}

class _infoState extends State<info> {
  @override
  void initState() {
    Map<String,dynamic> data =  {"id" : "5" , "price" : 5} ;
    final Firestore _db = Firestore.instance;
    //_db.collection('products').add(data) ;

    _db.collection('products').getDocuments().then((data){
      data.documents.map((document) => print(document.documentID)) ;
    });


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text('App Initiliazed')),
      ),
    );
  }
}
