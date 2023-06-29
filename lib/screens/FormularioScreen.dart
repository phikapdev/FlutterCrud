
import 'package:flutter/material.dart';

class FormularioScreen extends StatelessWidget {

  const FormularioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nuevo Cliente"),),
       body: Center(
         child: Text('FormularioScreen'),
      ),
    );
  }
}