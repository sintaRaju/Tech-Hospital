import 'package:flutter/material.dart';
import 'ui/su_lo/login.dart';
import './ui/home.dart';
import 'ui/su_lo/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tech Hospital',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

