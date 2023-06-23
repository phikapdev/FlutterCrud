import 'package:flutter/material.dart';
import 'package:flutter_crud/screens/HomeScreen.dart';
import 'package:flutter_crud/screens/FormularioScreen.dart';

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
        'home':(_) => HomeScreen(),
        'form':(_) => FormularioScreen()
      },
    );
  }
}

