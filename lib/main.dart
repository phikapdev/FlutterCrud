import 'package:flutter/material.dart';
import 'package:flutter_crud/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crud',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home':(_) => HomePage()
      },
    );
  }
}

