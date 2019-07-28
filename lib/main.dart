import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './ui/router.dart';
import './locator.dart';

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
      home: Scaffold(
        body: Container(
          child: Center(child: Text('App Initiliazed')),
        ),
      ),
    );
  }
}