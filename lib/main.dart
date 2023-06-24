import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_crud/screens/HomeScreen.dart';
import 'package:flutter_crud/screens/FormularioScreen.dart';
import 'package:flutter_crud/services/ClienteService.dart';

void main() {
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ClienteService())
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Crud',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home':(_) => HomeScreen(),
        'form':(_) => FormularioScreen()
      },
    );
  }
}

