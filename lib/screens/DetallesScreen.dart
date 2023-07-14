import 'package:flutter/material.dart';
import 'package:flutter_crud/services/ClienteService.dart';
import 'package:provider/provider.dart';

class DetallesScreen extends StatelessWidget {
  const DetallesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final clienteService = Provider.of<ClienteService>(context);
    final cliente = clienteService.selectedProduct;
    
      return Scaffold(
      appBar: AppBar(title: Text("Detalles Cliente")),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          child: Column(children: [
            SizedBox(height: 30),
            Container(child: Image.asset("assets/profile.png", width: 150, height: 150,)),
            SizedBox(height: 10),
            Text(cliente.nombre, style: TextStyle(fontSize: 20),),
            SizedBox(height: 10),
            Text(cliente.apellido, style: TextStyle(fontSize: 20),),
            SizedBox(height: 10),
            Text(cliente.email, style: TextStyle(fontSize: 20),),
          ]),
        ),
      )),
    );
  }
}
